class UserMailer < ApplicationMailer

	def welcome_email(user)
		@user = user
		@url = default_url_options[:host] + "/signin"
		mail(to: @user.email, subject: "Welcome to MuvieGoer!")
	end
end
