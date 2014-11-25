class PersonMailer < ActionMailer::Base
  default from: "contact@artisticnails.ie"

  def welcome_email(person)
  	@person = person
  	@url = 'http://artisticnails.com/login'
  	mail(to: @person.email, subject: 'Welcome to my awesome site')
  end
end
