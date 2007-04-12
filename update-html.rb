#!/usr/bin/env ruby

if ARGV.size < 1
  puts "Usage: #{$0} RD_DIR"
end

rd_dir = ARGV.shift

Dir.chdir(rd_dir) do
  Dir["*.rd"].each do |rd|
    commands = [
                "rd2", "-r", "rd/rd2html-lib", "--output-rbl",
                "-o", File.basename(rd, ".rd"), rd,
               ]
    system(*commands)
  end
end
