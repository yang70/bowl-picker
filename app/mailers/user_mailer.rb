class UserMailer < ApplicationMailer
  default from: "Football_Picker@football-picker.herokuapp.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to the Yang family college bowl picker challenge!")
  end
end
