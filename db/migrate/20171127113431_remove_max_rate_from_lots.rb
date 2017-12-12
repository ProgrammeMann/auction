class RemoveMaxRateFromLots < ActiveRecord::Migration[5.1]
  def change
  	remove_column :lots, :max_rate, :integer
  end
end
