class Lot < ApplicationRecord
	# has_attached_file :photo

	has_attached_file :photo, 
	  :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
	  :url => "/system/:attachment/:id/:style/:filename", 
	  :styles => { :medium => "300x300>", :thumb => "100x100>" },
	  :default_url => "path to default image"
	validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
