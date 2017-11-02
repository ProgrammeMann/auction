class AddAttachmentPhotoToLots < ActiveRecord::Migration[5.1]
  def self.up
    change_table :lots do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :lots, :photo
  end
end
