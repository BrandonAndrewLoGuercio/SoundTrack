# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

Rake::Task["assets:precompile"].clear
namespace :assets do
  task 'precompile' do
    puts "Not pre-compiling assets..."
  end
end