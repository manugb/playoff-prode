class ApplicationMailer < ActionMailer::Base
  default from: 'nba-playoff-prode@nbaplayoffprode.com'
  layout 'mailer'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Bienvenido')
  end
end
