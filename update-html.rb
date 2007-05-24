#!/usr/bin/env ruby

if ARGV.size < 1
  puts "Usage: #{$0} RD_DIR"
  exit 1
end

rd_dir = ARGV.shift
lang = File.basename(rd_dir)

rd_compiler = File.join(File.expand_path(File.dirname(__FILE__)),
                        "compile-rd.rb")

Dir.chdir(rd_dir) do
  Dir["*.rd"].each do |rd|
    rdc = "#{rd}c"
    unless system(rd_compiler, rd, rdc, lang)
      puts "failed to compile #{rd}"
      exit 1
    end

    title = File.read(rdc).scan(/^=+\s*(.*?)\s*$/m)[0][0]
    commands = [
                "rd2", "-r", "rd/rd2html-lib", "--output-rbl",
                "--html-lang", lang, "--html-charset", "UTF-8",
                "--html-title", title, "--with-css", "../doc.css",
                "-o", File.basename(rd, ".rd"), rdc,
               ]
    system(*commands)
  end
end
