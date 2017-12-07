class CheckEndTimeWorker
  include Sidekiq::Worker

  def perform(lot_id)
    winner_id= ActiveRecord::Base.connection.execute("SELECT user_id FROM rates WHERE lot_id = #{lot_id} AND value = (SELECT MAX(value) FROM rates)")
    @user = User.find(params[:winner_id])
    UserMailer.with(user: @user).welcome_email.deliver_now
  end
end
