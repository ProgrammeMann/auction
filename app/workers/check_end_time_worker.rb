class CheckEndTimeWorker
  include Sidekiq::Worker

  def perform(lot_id)
   	winner_id = Rate.where(lot_id: lot_id).order(value: :desc).limit(1).first.user_id
    UserMailer.winner_email(winner_id, lot_id).deliver_now
  end
end
