class Lot < ApplicationRecord

	has_attached_file :photo, 
	  :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
	  :url => "/system/:attachment/:id/:style/:filename", 
	  :styles => { :medium => "300x300>", :thumb => "100x100>" },
	  :default_url => "default.png"
	validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	has_many :rates, dependent: :destroy
	belongs_to :user

end
