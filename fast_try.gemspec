lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fast_try/version.rb'

Gem::Specification.new do |s|
  s.name        = 'fast_try'
  s.version     =  FastTry::VERSION
  s.author	= "Weston Ganger"
  s.email       = 'westonganger@gmail.com'
  s.homepage 	= 'https://github.com/westonganger/fast_try'
  
  s.summary     = "Provides the ability to set alias(es) to the safe navigation operator in Ruby"
  s.description = "Provides the ability to set alias(es) to the safe navigation operator in Ruby"
  s.files = Dir.glob("{lib/**/*}") + %w{ LICENSE README.md Rakefile CHANGELOG.md }
  s.test_files  = Dir.glob("{test/**/*}")
  s.require_path = 'lib'

  s.required_ruby_version = '>= 2.3.0'
  
  s.add_development_dependency 'rake'
  s.add_development_dependency 'bundler'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'minitest-reporters'
  s.add_development_dependency 'activesupport'
  s.add_development_dependency 'benchmark-memory'
end
