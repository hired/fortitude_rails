begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rdoc/task'

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'FortitudeRails'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

APP_RAKEFILE = File.expand_path("../spec/dummy/Rakefile", __FILE__)
load 'rails/tasks/engine.rake'

Bundler::GemHelper.install_tasks

require 'rspec/core'
require 'rspec/core/rake_task'

desc "Run all specs in spec directory (excluding plugin specs)"
RSpec::Core::RakeTask.new(:spec => 'app:db:test:prepare')

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

task :s => [:server]

task :server do |t, args|
  APP_PATH = File.join(File.dirname(__FILE__), 'spec/dummy/config/application')
  require_relative 'spec/dummy/config/boot'
  require 'rails/commands'
  require 'rails/commands/commands_tasks'
  args.shift
  Rails::CommandsTasks.new(args).run_command!('server')
end

namespace :dummy do
  APP_PATH = File.join(File.dirname(__FILE__), 'spec/dummy/config/application')
  require File.expand_path('spec/dummy/config/application')

  Rails.application.load_tasks
end


task default: :spec
