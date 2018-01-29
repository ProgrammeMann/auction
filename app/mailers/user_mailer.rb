class UserMailer < ApplicationMailer

	def winner_email(user_id, lot_id)
		@user = User.find_by_id(user_id)
		@lot = Lot.find_by_id(lot_id)
		@autor_lot = User.find_by_id(@lot.user_id)
		mail(to: @user.email, subject: "You win") do |format|
      		format.text
    	end
	end
end
