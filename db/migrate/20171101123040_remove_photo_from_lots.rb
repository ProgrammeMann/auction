class RemovePhotoFromLots < ActiveRecord::Migration[5.1]
  def change
    remove_column :lots, :photo, :string
  end
end
