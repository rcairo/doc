#!/usr/bin/env ruby

if ARGV.size < 1
  puts "Usage: #{$0} RD_DIR"
  exit 1
end

rd_dir = ARGV.shift
lang = File.basename(rd_dir)

base_dir = File.expand_path(File.dirname(__FILE__))
rd_compiler = File.join(base_dir, "compile-rd.rb")

$LOAD_PATH.unshift(base_dir)
require 'i18n'
load_message(lang)

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

    menus = <<-EOM
  <ul>
    <li><a href="./">#{_("Index")}</a></li>
  </ul>
EOM
    html = File.basename(rd, ".rd") + ".html"
    html_content = File.read(html)
    html_content = html_content.gsub(/<(\/?)body>/) do
      if $1.nil?
        <<-EOH
<body>
<div class="header">
#{menus}
</div>
EOH
      else
        <<-EOF
<div class="footer">
#{menus}
</div>
</body>
EOF
      end
    end
    File.open(html, "w") do |f|
      f.print(html_content)
    end
  end
end
