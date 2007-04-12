#!/usr/bin/env ruby
#
# mkrd.rb: Create RD style skelton
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

# Modified by Kouhei Sutou
#   DIRTIED!

require 'fileutils'

@output_dir = ARGV.shift || "doc"
FileUtils.mkdir_p(@output_dir)

#
# Set targets.
#
$TARGET_LIBS = ["cairo"]
$TARGET_MODULES = ["Cairo"]

$TARGET_LIBS.each do |lib|
  require lib
end

#################################################################
# Don't touch below.
#################################################################
require 'rbbr/metainfo'

$REF_VERSION = 0.9

RETURNS = "\n\n     * Returns: self\n"

@current_class = nil
@indexes = {}

def class_link(klass)
  link = "#{klass_to_page_name(klass)}/"
  link << (klass.is_a?(Class) ? "class" : "module")
  link << " #{klass.inspect}"
  link
end

def put_classmodule_info(mod)
  if Class === mod
    puts "= class #{mod.inspect}"
  else # Module
    puts "= module #{mod.inspect}"
  end
  puts ""
  if Class === mod and Object != mod
    puts "== Object Hierarchy"
    puts
    superclasses = [mod]
    sp = mod
    while sp = sp.superclass
      superclasses.push(sp)
    end
    depth = 0
    while sp = superclasses.pop
      sp_text = sp.inspect
      if @indexes.has_key?(sp) and sp != mod
        sp_text = "((<#{sp_text}|#{class_link(sp)}>))"
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
        mod_text = "((<#{included_mod.inspect}|#{class_link(included_mod)}>))"
      else
        mod_text = included_mod.inspect
      end
      puts "* #{mod_text}"
    end
    puts ""
  end
end

def put_methods(name, methods, prefix = "", postfix = "")
  return if methods.size == 0 or methods[0] == ""
  puts "== " + name
  puts
  methods.sort.each do |name|
    unless name == ""
      puts "--- " + prefix + name + postfix
      puts
    end
  end
  puts ""
end

@target_classes = []

def nest_classes(klass)
  if /(#{$TARGET_MODULES.join("|")})/ =~ klass.inspect
    unless @indexes.has_key?(klass)
      @target_classes << klass
      @indexes[klass] = {}
    end
  end

  @dag.arc(klass).each do |subklass|
    nest_classes(subklass)
  end
end

def klass_to_page_name(klass)
  klass.inspect.split(/::/).collect do |component|
    component.split(/([A-Z][^A-Z]+|[A-Z]+(?=[A-Z][^A-Z]))/).reject do |sub|
      sub.empty?
    end.join("-").downcase
  end.join("-") + ".rd"
end

def output_classes
  @target_classes.uniq.sort_by {|x| x.inspect}.each do |klass|
    file_name = klass_to_page_name(klass)
    File.open(File.join(@output_dir, file_name), "w") do |rd|
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
      page_name = klass_to_page_name(klass)

      index.puts "  * ((<#{klass.inspect}|#{class_link(klass)}>))"

      info[:constants].sort.each do |const|
        next if const.empty?
        next if @indexes.has_key?(klass.const_get(const))
        index.puts "  * ((<#{klass.inspect}::#{const}|#{page_name}/#{const}>))"
      end

      (info[:class_methods] || info[:module_functions]).sort.each do |method|
        next if method.empty?
        link = "#{page_name}/#{klass.inspect}.#{method}"
        index.puts "  * ((<#{klass.inspect}.#{method}|#{link}>))"
      end

      info[:instance_methods].sort.each do |method|
        next if method.empty?
        index.puts "  * ((<#{klass.inspect}##{method}|#{page_name}/#{method}>))"
      end
    end
  end
end

def output_class(klass)
  put_classmodule_info(klass)
  if klass.private_instance_methods(false).include?("initialize")
    new_method = "new"
  else
    new_method = ""
  end
  if klass.kind_of? Class
    methods = klass.methods - klass.superclass.methods + [new_method]
  else
    methods = klass.methods + [new_method]
    klass.included_modules_at.each do |included|
      methods -= included.methods
    end
    methods -= Object.methods
  end

  prop_methods = Array.new
  if (klass.kind_of? Class)
    #Class Methods
    put_methods("Class Methods", methods, klass.inspect + ".", RETURNS)
    @indexes[klass][:class_methods] = methods

    #Instance Methods
    instance_methods = klass.public_instance_methods(false) + klass.private_instance_methods(false) - ["initialize"] + klass.protected_instance_methods(false) - prop_methods
    put_methods("Instance Methods", instance_methods, "", RETURNS)
    @indexes[klass][:instance_methods] = instance_methods
    #Property accessor
    prop_methods -= instance_methods
  else

    #Module function
    put_methods("Module Functions", methods, klass.inspect + ".", RETURNS)
    @indexes[klass][:module_functions] = methods

    funcs = klass.public_instance_methods(false) - ["initialize"] + klass.protected_instance_methods(false)
    #Module function(Instance Methods for including)
    put_methods("Instance Methods", funcs, "", RETURNS)
    @indexes[klass][:instance_methods] = funcs
  end

  #Constants
  constants = []
  klass.constants_at.each do |const|
    constants << const unless @indexes.has_key?(klass.const_get(const))
  end
  put_methods("Constants", constants)
  @indexes[klass][:constants] = constants

  puts "== See Also"
  puts
  puts "  * ((<Index|index.rd/Index>))"
  puts
  puts "== ChangeLog"
  puts ""
end

@dag = RBBR::MetaInfo::ModuleDAG.full_module_dag
nest_classes(Object)
(@dag.roots - [Object]).sort{|x, y| x.inspect <=> y.inspect}.each do |modul|
  nest_classes(modul)
end
output_classes
output_index
