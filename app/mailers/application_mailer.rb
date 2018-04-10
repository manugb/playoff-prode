class ApplicationMailer < ActionMailer::Base
  default from: 'info@nbaplayoffprode.com'
  layout 'mailer'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Bienvenido')
  end
end
