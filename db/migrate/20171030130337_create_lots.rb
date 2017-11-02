class CreateLots < ActiveRecord::Migration[5.1]
  def change
    create_table :lots do |t|
      t.string :title
      t.text :description
      t.integer :start_price
      t.string :photo
      t.datetime :start_datetime
      t.datetime :end_datetime

      t.timestamps
    end
  end
end
