class UserMailer < ApplicationMailer

	def winner_email(user_id, lot_id)
		@user = User.find_by_id(user_id)
		mail(to: @user.email, subject: "Welcome") do |format|
      		# format.text
      		format.html
    	end
	end
end
