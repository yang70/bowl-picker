desc "This task is called by the Heroku scheduler add-on"
task :scheduler_test => :environment do
  puts "Running scheduler test"
  another_test
  puts "done."
end
