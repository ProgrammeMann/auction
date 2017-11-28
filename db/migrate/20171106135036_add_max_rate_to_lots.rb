class AddMaxRateToLots < ActiveRecord::Migration[5.1]
  def change
    add_column :lots, :max_rate, :integer
  end
end
