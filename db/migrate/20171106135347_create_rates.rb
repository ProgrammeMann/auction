class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.integer :user_id
      t.integer :lot_id
      t.integer :users_rate

      t.timestamps
    end
  end
end
