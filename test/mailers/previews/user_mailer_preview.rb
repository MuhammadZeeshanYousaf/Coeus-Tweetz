# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/follow_email
  def follow_email
    UserMailer.with(follower_user: User.find(5), followed_user: User.find(4)).follow_email
  end

end
