class RenameUserRatesToValue < ActiveRecord::Migration[5.1]
  def change
  	rename_column :rates, :users_rate, :value
  end
end
