require "bundler/gem_tasks"
require 'rake/testtask'

# ref: http://rpheath.com/posts/394-get-the-most-out-of-test-unit
# ref: http://stackoverflow.com/a/8395163
Rake::TestTask.new(:test) do |t|
  t.verbose = false
  t.pattern = 'spec/*_spec.rb'
end
Rake::Task['test'].comment = 'no hands!'
task :default => [:test]
