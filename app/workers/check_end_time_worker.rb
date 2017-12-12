class CheckEndTimeWorker
  include Sidekiq::Worker

  def perform(lot_id)
    winner_id= ActiveRecord::Base.connection.execute("SELECT user_id FROM rates WHERE lot_id = #{lot_id} AND value = (SELECT MAX(value) FROM rates)")
    UserMailer.delay.winner_email(winner_id).deliver_now
  end
end
