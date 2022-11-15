class ProfileMailer < ApplicationMailer
  def welcome_email
    @profile = params[:profile]
    @url = "http://localhost:3000/"
    mail(to: @profile.user.email, subject: "Welcome to Odin Facebook")
  end
end
