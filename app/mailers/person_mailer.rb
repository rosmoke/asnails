class PersonMailer < ActionMailer::Base
  default from: "contact@artisticnails.ie"

  def welcome_email(booking)
  	@booking = booking
  	@url = 'http://artisticnails.com/login'
  	mail(to: @booking.email, subject: 'Welcome to my awesome site')
  end
end
