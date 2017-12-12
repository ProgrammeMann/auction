class AddUserIdToLots < ActiveRecord::Migration[5.1]
  def change
  	add_column :lots, :user_id, :integer
  end
end
