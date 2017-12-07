class UserMailer < ApplicationMailer
	default from: 'from@example.com'

	def winner_email

		@user = params[:user]
		mail(to: @user.email)

		
	end

end
