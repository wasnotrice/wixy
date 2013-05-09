lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wixy/version'

Gem::Specification.new do |s|
  s.name              = 'wixy'
  s.version           = Wixy::VERSION
  s.date              = '2013-05-09'
  s.summary           = 'Classical, pencil-and-paper ciphers'
  s.description       = <<-EOS
    A library for working with classical ciphers of the
    pencil-and-paper sort.
  EOS

  s.author            = 'Eric Watson'
  s.email             = 'wasnotrice@gmail.com'
  s.license           = 'MIT'
  s.homepage          = 'http://rubygems.org/gems/wixy'
  s.rubyforge_project = 'wixy'

  s.platform          = Gem::Platform::CURRENT
  s.require_paths     = ['lib']
  s.files             = `git ls-files lib`.split("\n") + ['LICENSE']
  s.test_files        = `git ls-files spec`.split("\n")
  s.bindir            = 'bin'
  s.executables << 'wixy'
  s.add_development_dependency 'rspec', '~> 2.0'
end
