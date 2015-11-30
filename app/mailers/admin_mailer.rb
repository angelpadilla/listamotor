class AdminMailer < ApplicationMailer
  default from: "Sistema #{SITE} <info@autos.com>"
  def new_user(user)
    @user = user
    mail to: EMAIL, subject: "Nuevo usuario registrado en #{SITE} #{user.email}"
  end
  def welcome(user)
    @user = user
    mail to: user.email, subject: "Bienvenido a #{SITE}!"
  end
end
