#!/usr/bin/env ruby
#
# update-rd.rb: based on mkrd.rb
#   Modified by Kouhei Sutou
#
# Original:
# mkrd.rb: Create RD style skeleton
#
#   $Id: mkrd.rb,v 1.9 2005/06/07 14:09:56 ktou Exp $
#
# Usage: LANG="C"; ruby mkrd.rb
# You need set LANG environment variables to "C"
#
# Copyright (C) 2003 Masao Mutoh
#
# This program is free software.
# You can distribute/modify this program under
# the terms of the Ruby Distribute License.
#

require 'English'
require 'fileutils'
require 'optparse'
require 'ostruct'

#
# Set targets.
#
target_libs = ["cairo"]
target_modules = ["Cairo"]

target_libs.each do |lib|
  require lib
end

default_output_dir = "doc"
options = OpenStruct.new
options.replace = false

opts = OptionParser.new do |opts|
  opts.banner += " [OUTPUT_DIR]"

  opts.separator ""
  opts.on("-oDIR", "--output-dir=DIR",
          "Output into DIR. [#{default_output_dir}]") do |dir|
    options.output_dir = dir
  end

  opts.on("--[no-]replace", "Don't merge exist RD.") do |replace|
    options.replace = replace
  end
end

options.output_dir = opts.parse!(ARGV).shift || default_output_dir


#################################################################
# Don't touch below.
#################################################################
require 'rbbr/metainfo'

$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rd-lib'

class UpdateRD
  include RDLib

  RETURNS = "     * Returns: self"

  def initialize(target_modules, output_dir, replace)
    @target_modules = target_modules
    @output_dir = output_dir
    @replace = replace
    @target_classes = []
    @current_class = nil
    @indexes = {}
    FileUtils.mkdir_p(@output_dir)
    @dag = RBBR::MetaInfo::ModuleDAG.full_module_dag
  end

  def run
    nest_classes(Object)
    (@dag.roots - [Object]).sort{|x, y| x.inspect <=> y.inspect}.each do |mod|
      nest_classes(mod)
    end
    output_classes
    output_index
  end

  private
  def put_classmodule_info(mod)
    if mod.class?
      puts "= class #{mod.inspect}"
    else
      puts "= module #{mod.inspect}"
    end
    puts
    if @indexes[mod][:description]
      puts @indexes[mod][:description]
      puts
    end

    if mod.class? and Object != mod
      puts "== Object Hierarchy"
      puts
      superclasses = [mod]
      sp = mod
      while sp = sp.superclass
        superclasses.push(sp)
      end
      depth = 0
      while sp = superclasses.pop
        if @indexes.has_key?(sp) and sp != mod
          sp_text = "((<#{sp.inspect}>))"
        else
          sp_text = sp.inspect
        end
        puts "#{' ' * 2 * depth}* #{sp_text}"
        depth += 1
      end
      puts ""
    end
    included_modules_at = mod.included_modules_at
    unless included_modules_at.empty?
      puts "== Included Modules"
      puts
      included_modules_at.each do |included_mod|
        if @indexes.has_key?(included_mod)
          mod_text = class_link(included_mod)
        else
          mod_text = included_mod.inspect
        end
        puts "* #{mod_text}"
      end
      puts ""
    end
  end

  def put_methods(title, methods, methods_info=nil, prefix="", postfix="",
                  default_desc=nil)
    method_names = []
    methods_info ||= []
    method_names = methods_info.collect do |name, desc|
      name.gsub(/(?:\A.*[\.\#]|\(.*\Z)/, '')
    end
    methods -= method_names
    method_names += methods
    target_methods = methods_info
    target_methods += methods.sort.collect do |name|
      ["#{prefix}#{name}#{postfix}"]
    end
    return method_names if target_methods.size == 0

    puts "== " + title
    puts
    target_methods.each do |name, desc|
      puts "--- #{name}"
      method_desc = (desc || default_desc).to_s.rstrip
      unless method_desc.empty?
        puts
        puts method_desc
        puts
      end
    end
    method_names
  end

  def nest_classes(klass)
    if /(#{@target_modules.join("|")})/ =~ klass.inspect
      unless @indexes.has_key?(klass)
        @target_classes << klass
        @indexes[klass] = {}
      end
    end

    @dag.arc(klass).each do |subklass|
      nest_classes(subklass)
    end
  end

  def rd_file(klass)
    File.join(@output_dir, klass_to_page_name(klass))
  end

  def read_entries(component)
    title, *entries = component.split(/^---\s*.*?/m)
    entries.collect do |entry|
      entry.split(/\n+/, 2)
    end
  end

  def read_initial_info(klass)
    return unless File.exists?(rd_file(klass))
    _, *components = File.read(rd_file(klass)).split(/^=+\s*.*?/m)
    info = {}
    components.each do |component|
      case component
      when /\A(?:class|module)\s+(.*)/
        return if $1 != klass.inspect
        description = $POSTMATCH.strip
        info[:description] = description unless description.empty?
      when /\AClass Methods/
        info[:class_methods_info] = read_entries(component)
      when /\AModule Functions/
        info[:module_functions_info] = read_entries(component)
      when /\AInstance Methods/
        info[:instance_methods_info] = read_entries(component)
      when /\ASee Also/
        title, info[:see_also] = component.split(/\n+/, 2)
      when /\AChangeLog/
        title, info[:change_log] = component.split(/\n+/, 2)
      end
    end
    @indexes[klass].merge!(info)
  end

  def output_classes
    @target_classes.uniq.sort_by {|x| x.inspect}.each do |klass|
      read_initial_info(klass) unless @replace
      File.open(rd_file(klass), "w") do |rd|
        stdout = $stdout
        begin
          $stdout = rd
          output_class(klass)
        ensure
          $stdout = stdout
        end
      end
    end
  end

  def output_index
    File.open(File.join(@output_dir, "index.rd"), "w") do |index|
      index.puts "= Index"
      index.puts
      @indexes.sort_by {|klass, info| klass.inspect}.each do |klass, info|
        index.puts "  * ((<#{klass.inspect}>))"

        info[:constants].sort.each do |name, desc|
          next if @indexes.has_key?(klass.const_get(name))
          index.puts "  * ((<#{klass.inspect}::#{name}>))"
        end

        methods = info[:class_methods] || info[:module_functions]
        methods.sort.each do |name, desc|
          index.puts "  * ((<#{klass.inspect}.#{name}>))"
        end

        info[:instance_methods].sort.each do |name, desc|
          index.puts "  * ((<#{klass.inspect}\##{name}>))"
        end
      end
    end
  end

  def new_methods(klass)
    if klass.private_instance_methods(false).include?("initialize")
      ["new"]
    else
      []
    end
  end

  def output_class(klass)
    put_classmodule_info(klass)
    if klass.class?
      put_class_methods(klass)
    else
      put_module_functions(klass)
    end
    put_instance_methods(klass)
    put_constants(klass)
    put_see_also(klass)
    put_change_log(klass)
  end

  def put_class_methods(klass)
    methods = klass.methods - klass.superclass.methods + new_methods(klass)
    @indexes[klass][:class_methods] =
      put_methods("Class Methods", methods,
                  @indexes[klass][:class_methods_info],
                  klass.inspect + ".", "", RETURNS)
  end

  def put_module_functions(klass)
    methods = klass.methods + new_methods(klass)
    klass.included_modules_at.each do |included|
      methods -= included.methods
    end
    methods -= Object.methods
    @indexes[klass][:module_functions] =
      put_methods("Module Functions", methods,
                  @indexes[klass][:module_functions_info],
                  klass.inspect + ".", "", RETURNS)
  end

  def put_instance_methods(klass)
    if klass.class?
      instance_methods = klass.public_instance_methods(false) +
        klass.protected_instance_methods(false)
    else
      instance_methods = klass.public_instance_methods(false) - ["initialize"] +
        klass.protected_instance_methods(false)
    end
    @indexes[klass][:instance_methods] =
      put_methods("Instance Methods", instance_methods,
                  @indexes[klass][:instance_methods_info], "", "", RETURNS)
  end

  def put_constants(klass)
    constants = []
    klass.constants_at.each do |const|
      constants << const unless @indexes.has_key?(klass.const_get(const))
    end
    @indexes[klass][:constants] =
      put_methods("Constants", constants, @indexes[klass][:constants_info])
  end

  def put_see_also(klass)
    puts "== See Also"
    puts
    see_also = @indexes[klass][:see_also]
    if see_also
      puts see_also
    else
      puts "  * ((<Index>))"
      puts
    end
  end

  def put_change_log(klass)
    puts "== ChangeLog"
    puts
    change_log = @indexes[klass][:change_log]
    if change_log
      puts change_log
    else
      puts
    end
  end
end

UpdateRD.new(target_modules, options.output_dir, options.replace).run
