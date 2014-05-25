# -*- coding: utf-8; mode: ruby -*-

require "rsvg2"

base_dir = File.join(File.dirname(__FILE__))

langs = [
  ["en", "English"],
  ["ja", "日本語"],
]

src_css          = File.join(base_dir, "doc.css")
src_title_image  = File.join(base_dir, "rcairo-title.png")
src_title_svg    = File.join(base_dir, "rcairo-title.svg")
dest_dir         = "_site"
dest_index       = File.join(dest_dir, "index.html")
dest_css         = File.join(dest_dir, "doc.css")
dest_title_image = File.join(dest_dir, "rcairo-title.png")
task(dest_index).instance_variable_get("@actions").clear

namespace :html do
  desc "Remove generated HTML from #{dest_dir}/"
  task :clean do
    langs.each do |lang,|
      lang_dest_dir = File.join(dest_dir, lang)
      rm(Dir[File.join(lang_dest_dir, "*.html")])
    end
  end

  desc "Generate HTML to #{dest_dir}/"
  task :generate => dest_index

  file src_title_image => src_title_svg do
    handle = RSVG::Handle.new_from_file(src_title_svg)
    dim = handle.dimensions
    width = dim.width
    height = dim.height
    Cairo::ImageSurface.new(:argb32, width, height) do |surface|
      Cairo::Context.new(surface) do |context|
        context.render_rsvg_handle(handle)
      end
      surface.write_to_png(src_title_image)
    end
  end

  file dest_dir do
    mkdir_p(dest_dir)
  end

  file dest_title_image => [dest_dir, src_title_image] do
    cp(src_title_image, dest_title_image)
  end

  file dest_css => [src_css, dest_title_image] do
    cp(src_css, dest_css)
  end

  file dest_index => dest_css do
    File.open(dest_index, "w") do |index|
      index << <<-END_OF_HTML
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>rcairo reference manual</title>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
  </head>

  <body>
    <h1>rcairo reference manual</h1>

    <ul>
      END_OF_HTML

      langs.each do |lang, native_lang|
        index << <<-END_OF_HTML
      <li><a href="#{lang}/">#{native_lang}</a></li>
        END_OF_HTML
      end

      index << <<-END_OF_HTML
    </ui>

    <p><a href="../">Up</a></p>
  </body>
</html>
      END_OF_HTML
    end
  end

  langs.each do |lang,|
    lang_dest_dir = File.join(dest_dir, lang)
    directory lang_dest_dir
    lang_dest_index = File.join(lang_dest_dir, "index.html")
    file dest_index => lang_dest_index
    file lang_dest_index => [lang_dest_dir] do
      lang_dest_dir = File.join(dest_dir, lang)
      lang_src_dir = File.join(base_dir, lang)
      cp(Dir[File.join(lang_src_dir, "*.rd")], lang_dest_dir)
      ruby(File.join(base_dir, "update-html.rb"), lang_dest_dir)
      ruby(File.join(base_dir, "update-html.rb"), lang_dest_dir)
      rm(Dir[File.join(lang_dest_dir, "*.{rd,rdc,rbl}")])
    end
  end
end

# experimental
desc "Deploy to GitHub pages"
task :deploy do
  Dir.chdir(dest_dir) do
    system("git", "init") unless File.exist?(".git")
    system("git", "remote", "add", "working", "git@github.com:rcairo/doc.git")
    system("git", "checkout", "-b", "gh-pages")
    system("git", "add", "-A")
    system("git", "commit", "-m", "Deploy task")
    system("git", "push", "working", "gh-pages", "--force")
  end
end
