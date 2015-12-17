class UserMailer < ApplicationMailer
  default from: "Football_Picker@football-picker.herokuapp.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to the Yang family college bowl picker challenge!")
  end

  def log_in_reminder_email(user)
    @user = user
    mail(to: @user.email, subject: "Yang Family Bowl Challenge Reminder")
  end

  def incomplete_picks_email(user, picks_left)
    @user = user
    @picks_left = picks_left
    mail(to: @user.email, subject: "Yang Family Bowl Challenge Reminder")
  end

  def confirm_picks_email(user)
    @user = user
    mail(to: @user.email, subject: "Yang Family Bowl Challenge - You're All Set!")
  end
end
