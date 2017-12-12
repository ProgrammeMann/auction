class UserMailer < ApplicationMailer
	default from: 'hikkas.from.506@gmail.com'

	def winner_email(user_id)
		@user = User.find_by_id(user_id)
		mail(to: @user.email, subject: "Welcome") do |format|
      		# format.text
      		format.html
    	end
	end
end
