desc "This task is called by the Heroku scheduler add-on"
task :send_welcome_emails => :environment do
  User.send_welcome_emails
end

task :update_user_scores => :environment do
  puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
  puts "Evaluating user picks"
  Game.process_user_picks
  puts "Processing user scores"
  Game.process_user_scores
  puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
end

task :send_weekly_emails => :environment do
  puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
  puts "Sending weekly score emails"
  User.send_weekly_email
  puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
end

task :send_reminder_emails => :environment do
  if Time.now.strftime("%A") == "Thursday"
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    puts "Sending reminder emails"
    User.send_reminder_email
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
  else
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    puts "Today is not Thursday"
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
  end
end

task :test_current_week => :environment do
  week = get_current_week
  puts "Week: " + week
end


