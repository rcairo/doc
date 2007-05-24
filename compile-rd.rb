#!/usr/bin/env ruby

if ARGV.size < 2
  puts "Usage: #{$0} RD COMPILED_RD"
  exit 1
end

rd, rdc, = ARGV

require 'English'
require 'cairo'

$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rd-lib'

section = nil
cairo_signature_re =
  /\bCairo(?:::[A-Z][\w\d_]+)*(?:[#.][\[_@\w\d]*(?:[=?!_*+\-\]]|\b)|\b)/
auto_linked_rd = File.open(rd).collect do |line|
  case line
  when /^---/
    line
  when /^=+\s+(.*)\s+$/
    section = $1
    line
  else
    line.gsub(/(\(\(<)?(#{cairo_signature_re}|Index)/) do |signature|
      if $1 or section == "Object Hierarchy"
        signature
      else
        "((<#{signature}>))"
      end
    end
  end
end.join

compiled_rd = auto_linked_rd.gsub(/\(\(<(.*?)>\)\)/) do |link|
  link_content = $1
  case link_content
  when "Index"
    RDLib.index_link
  when /URL:/, /\|/
    link
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
    link
  end
end

File.open(rdc, "w") do |output|
  output.print compiled_rd
end
