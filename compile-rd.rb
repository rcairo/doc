#!/usr/bin/env ruby

if ARGV.size < 2
  puts "Usage: #{$0} RD COMPILED_RD [LANG]"
  exit 1
end

rd, rdc, lang, = ARGV

require 'English'
require 'cairo'

$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'cairo-dummy'
require 'rd-lib'
require 'i18n'
load_message(lang)

section = nil
cairo_signature_re =
  /\bCairo(?:::[A-Z][\w\d_]+)*(?:[#.][\[_@\w\d]*(?:[=?!_*+\-\]]|\b)|\b)/
in_pre = false
auto_linked_rd = File.open(rd).collect do |line|
  case line
  when /^#\s*(\S*)\s*/ #
    pragma = $1
    case pragma
    when "start-pre"
      in_pre = true
    when "end-pre"
      in_pre = false
    end
    line
  when /^---/
    line
  when /^=+\s+(.*)\s+$/
    section = $1
    if /\A(class|module) (.+)\z/ =~ section
      type, klass = $1, $2
      line.gsub(section, _("#{type} %s") % klass)
    else
      line.gsub(section, _(section))
    end
  else
    line = line.gsub(/\*\s*(Returns|Block returns)\s*:\s*/) do
      "* #{_($1)}: "
    end
    line.gsub(/(\(\(<(?:[^|]+\|)?)?(#{cairo_signature_re}|Index)/) do |signature|
      link_markup = $1
      if link_markup or section == "Object Hierarchy" or in_pre
        signature
      else
        "((<#{signature}>))"
      end
    end
  end
end.join

def resolve_link(link_content)
  case link_content
  when /\./
    klass_name = $PREMATCH
    method_name = $POSTMATCH
    klass = eval(klass_name)
    RDLib.class_method_link(klass, method_name)
  when /#/ #
    klass_name = $PREMATCH
    method_name = $POSTMATCH
    klass = eval(klass_name)
    RDLib.instance_method_link(klass, method_name)
  when "Cairo", /::/
    klass = eval(link_content)
    if klass.is_a?(Module)
      RDLib.class_link(klass)
    else
      components = link_content.split(/::/)
      const = components.pop
      klass = eval(components.join("::"))
      RDLib.constant_link(klass, const)
    end
  else
    nil
  end
end

compiled_rd = auto_linked_rd.gsub(/\(\(<(.*?)>\)\)/) do |link|
  link_content = $1
  case link_content
  when "Index"
    RDLib.index_link(_("Index"))
  when /URL:/
    link
  when /\|/
    label = $PREMATCH
    link_content = $POSTMATCH
    resolved_link = resolve_link(link_content)
    if resolved_link.nil?
      link
    else
      resolved_link.sub(/\A(\(\(<)(?:[^|]+\|)?/, "\\1#{label}|")
    end
  else
    resolve_link(link_content) || link
  end
end

File.open(rdc, "w") do |output|
  output.print compiled_rd
end
