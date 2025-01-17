# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','mdless','version.rb'])
spec = Gem::Specification.new do |s|
  s.name = 'mdless'
  s.version = CLIMarkdown::VERSION
  s.author = 'Brett Terpstra'
  s.email = 'me@brettterpstra.com'
  s.homepage = 'http://brettterpstra.com/project/mdless/'
  s.platform = Gem::Platform::RUBY
  s.summary = 'A pager like less, but for Markdown files'
  s.description = 'A CLI that provides a formatted and highlighted view of Markdown files in a terminal'
  s.license = 'MIT'
  s.files = %w(
bin/mdless
lib/mdless.rb
lib/mdless/colors.rb
lib/mdless/tables.rb
lib/mdless/converter.rb
lib/mdless/version.rb
lib/mdless/theme.rb
lib/mdless/hash.rb
  )
  s.require_paths << 'lib'
  s.extra_rdoc_files = ['README.md']
  s.rdoc_options << '--title' << 'mdless' << '--main' << 'README.md' << '--markup' << 'markdown' << '-ri'
  s.bindir = 'bin'
  s.executables << 'mdless'
  s.add_development_dependency 'rake', '~> 13'
  s.add_development_dependency 'rdoc', '>= 6.3.1'
end
