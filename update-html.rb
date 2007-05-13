#!/usr/bin/env ruby

if ARGV.size < 1
  puts "Usage: #{$0} RD_DIR"
  exit 1
end

rd_dir = ARGV.shift

rd_compiler = File.join(File.expand_path(File.dirname(__FILE__)),
                        "compile-rd.rb")

Dir.chdir(rd_dir) do
  Dir["*.rd"].each do |rd|
    rdc = "#{rd}c"
    unless system(rd_compiler, rd, rdc)
      puts "failed to compile #{rd}"
      exit 1
    end

    commands = [
                "rd2", "-r", "rd/rd2html-lib", "--output-rbl",
                "-o", File.basename(rd, ".rd"), rdc,
               ]
    system(*commands)
  end
end
