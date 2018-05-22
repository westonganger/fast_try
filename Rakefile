require File.expand_path(File.dirname(__FILE__) + '/lib/fast_try/version.rb')
require 'bundler/gem_tasks'

task :test do 
  require 'rake/testtask'
  Rake::TestTask.new do |t|
    t.libs << 'test'
    t.test_files = FileList['test/**/*_test.rb']
    t.verbose = true
  end
end

task default: :test

task :console do
  require 'fast_try'

  require 'irb'
  binding.irb
end

task :benchmark do
  require_relative 'test/benchmark.rb'
end
