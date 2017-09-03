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

desc "Task to get rid of friendship interactions that are older than 3 days"
task :delete_if_outdated => :environment do
  puts "Removing friendship interactions older than 3 days"
  FriendshipInteraction.delete_if_outdated
  puts "done."
end
