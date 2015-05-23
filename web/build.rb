# builds lilypond scores and a static website to offer them for download

require 'fileutils'
require 'markaby'
require 'lyv'
Dwn = Struct.new :ly, :pdf, :title

$lily_parser = Lyv::LilyPondParser.new
Markaby::Builder.set :output_helpers, false

def dir_readme_file(dir)
  Dir[File.join dir, 'README*'].sort.first
end

def dir_readme(dir)
  File.read(dir_readme_file(dir))
end

def dir_title(dir)
  File.open(dir_readme_file(dir)).gets.sub(/^\s*#\s*/, '')
rescue
  STDERR.puts "error in directory #{dir}"
  raise
end

# recursively builds content of the given directory
def build_dir(dir, dest_dir)
  STDERR.puts "building #{dir} -> #{dest_dir}"

  FileUtils.mkdir_p dest_dir

  ly_files = Dir[File.join dir, '*.ly']
  downloads = ly_files.sort.collect do |ly|
    FileUtils.copy ly, dest_dir
    `lilypond -drelative-includes=#t -o #{dest_dir} #{ly}`

    lily_doc = $lily_parser.parse_document(File.read(ly))
    ttl = lily_doc.header['title']
    if ttl and not ttl.empty?
      ttl = lily_doc.header['hymnal_number'] + '. ' + ttl
    end

    ly = File.basename ly
    pdf = ly.sub('.ly', '.pdf')

    Dwn.new ly, pdf, ttl
  end

  subdirs = Dir.new(dir).select do |f|
    if f.start_with? '.' or f.start_with? '_' or f.start_with? 'web'
      false
    elsif not File.directory? File.join(dir, f)
      false
    else
      true
    end
  end

  html_builder = Markaby::Builder.new
  index = html_builder.html5 do
    head do
      meta charset: 'utf-8'
      #title dir_title(dir)
    end
    body do
      h1 dir_title(dir)
      #div dir_readme(dir)

      unless subdirs.empty?
        ul do
          subdirs.each do |sub|
            li do
              a href: File.join('.', File.basename(sub)) do
                dir_title File.join(dir, sub)
              end
            end
          end
        end
      end

      unless downloads.empty?
        ul do
          downloads.each do |dwn|
            next if dwn.title.empty?

            li do
              span dwn.title
              span ' '
              a href: dwn.pdf do
                'pdf'
              end
              span ' '
              a href: dwn.ly do
                'ly'
              end
            end
          end
        end
      end
    end
  end

  f = File.join dest_dir, 'index.html'
  File.open f, 'w' do |fw|
    fw.puts index.to_s
  end

  subdirs.each do |sub|
    subpath = File.join dir, sub
    destpath = File.join dest_dir, sub
    build_dir subpath, destpath
  end
end

src_dir = ARGV[0]
dest_dir = ARGV[1] rescue '_build'
build_dir src_dir, dest_dir
