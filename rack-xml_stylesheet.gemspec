# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'rack/xml_stylesheet'

Gem::Specification.new do |s|
  s.name        = "rack-xml_stylesheet"
  s.version     = Rack::XMLStylesheet::VERSION == "0.0.0" ? "0.0.1" : Rack::XMLStylesheet::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Marcelo Manzan"]
  s.email       = ["manzan@gmail.com"]
  s.homepage    = "http://github.com/kawamanza/rack-xml_stylesheet"
  s.summary     = %q{Adds processing instructions to transform XML by clients}
  s.description = %q{It's a rack middleware to add processing instructions on documents of response type XML.}

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "rack-xml_stylesheet"

  s.add_dependency "rack", '>= 1.0'
  
  s.add_development_dependency "step-up"

  excepts = %w[
    .gitignore
    rack-xml_stylesheet.gemspec
  ]
  tests = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.files              = `git ls-files`.split("\n") - excepts - tests
  s.test_files         = tests
  s.require_paths      = ["lib"]
end
