# Mandrill
ActionMailer::Base.smtp_settings = {
	address: "smtp.mandrillapp.com",
	port: 587,
	enable_starttls_auto: true,
	user_name: "angelpadillam@gmail.com",
	password: "SyCDS70CVEtKG-ysWovGfg",
	authentication: "login"
}
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"

EMAIL = 'hola@listamotor.mx'
SITE = 'listamotor.mx'
TITLE = 'listamotor';
TWITTER = "https://twitter.com/?lang=en";
FACEBOOK = "https://twitter.com/?lang=en";

PAGINATE = 100