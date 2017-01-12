# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

desc "This task is called by the Heroku scheduler add-on"
task :update_mood_level => :environment do
  puts "Updating pet mood level..."
  Pet.update_mood_level
  puts "done."
end
