class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: t(:mail_activation_acc)
  end

  def password_reset user
    @user = user
    mail to: user.email, subject: t(:mail_reset_password)
  end
end
