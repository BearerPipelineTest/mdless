require 'rake/clean'
require 'rubygems'
require 'rubygems/package_task'
require 'rdoc'
require 'rdoc/task'


Rake::RDocTask.new do |rd|
  rd.main = "README.md"
  rd.rdoc_files.include("README.md","lib/**/*.rb","bin/**/*")
  rd.title = 'mdless'
  rd.markup = 'markdown'
end

spec = eval(File.read('mdless.gemspec'))

Gem::PackageTask.new(spec) do |pkg|
end

desc 'Install the gem in the current ruby'
task :install, :all do |t, args|
  args.with_defaults(:all => false)
  if args[:all]
    sh "rvm all do gem install pkg/*.gem"
    sh "sudo gem install pkg/*.gem"
  else
    sh "gem install pkg/*.gem"
  end
end

desc 'Development version check'
task :ver do |t|
  system "grep VERSION lib/mdless/version.rb"
end

desc 'Bump incremental version number'
task :bump, :type do |t, args|
  args.with_defaults(:type => "inc")
  version_file = "lib/mdless/version.rb"
  content = IO.read(version_file)
  content.sub!(/VERSION = '(\d+)\.(\d+)\.(\d+)(\S+)?'/) {|m|
    major = $1.to_i
    minor = $2.to_i
    inc = $3.to_i
    pre = $4

    case args[:type]
    when /^maj/
      major += 1
      minor = 0
      inc = 0
    when /^min/
      minor += 1
      inc = 0
    else
      inc += 1
    end

    $stdout.print "#{major}.#{minor}.#{inc}#{pre}"
    "VERSION = '#{major}.#{minor}.#{inc}#{pre}'"
  }
  File.open(version_file, 'w+') {|f|
    f.puts content
  }
end

task :default => [:test,:features]
task :build => [:clobber,:rdoc,:package]

