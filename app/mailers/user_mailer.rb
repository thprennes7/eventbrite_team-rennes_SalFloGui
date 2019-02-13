class UserMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'

  def welcome_email(user)
    from = Email.new(email: 'https://eventbrite-guhurak.herokuapp.com/')
		to = Email.new(email: @user.mailer)
		subject = 'Binevenue'
		content = Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
		mail = Mail.new(from, subject, to, content)

		sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
		response = sg.client.mail._('send').post(request_body: mail.to_json)
		puts response.status_code
		puts response.body
		puts response.headers
  end
end
