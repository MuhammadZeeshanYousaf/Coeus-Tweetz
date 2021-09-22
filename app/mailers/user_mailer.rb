class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.follow_email.subject
  #
  def follow_email
    @greeting = "Hi"
    @follower_user = params[:follower_user]
    @followed_user = params[:followed_user]
    attachments['twitter.png'] = File.read('app/assets/images/twitter.png')

    mail(to: @followed_user.email,
         subject: "Coeus-Tweetz Follower Activity Email")
  end

end
