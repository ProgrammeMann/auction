class Rate < ApplicationRecord
  belongs_to :lot
  belongs_to :user

  validates :value, :lot_id, :user_id, presence: true

  validate :check_value

  def check_value
    unless (max_rate.getvalue(0, 0).nil? || max_rate.getvalue(0, 0) < value) && lot.start_price <= value
      errors.add(:value, "Your rate very small, please enter rate more than #{max_rate.getvalue(0, 0)} and #{lot.start_price}")
    end
  end

  def max_rate
    ActiveRecord::Base.connection.execute("SELECT max(rates.value) FROM rates WHERE (lot_id = #{lot_id})")
    end
end
