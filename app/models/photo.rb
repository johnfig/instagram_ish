class Photo < ActiveRecord::Base
	attr_accessible :photo, :name

  has_attached_file :photo, :styles => { :small => "150x150>" },
                  :url  => "/assets/products/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

	validates_attachment_presence :photo
	validates_attachment_size :photo, :less_than => 5.megabytes
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

	after_create :amazon_url_update

	def amazon_url_update
		new_url = self.photo.url.gsub!("s3", "s3-us-west-2")
		self.photo.url = new_url
	end
end
