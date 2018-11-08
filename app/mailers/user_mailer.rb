class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, subject: t("mail.active.subject")
  end

  def password_reset user
    @user = user
    mail to: user.email, subject: t("mail.reset.subject")
  end
end
