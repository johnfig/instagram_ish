class Photo < ActiveRecord::Base
	attr_accessible :photo, :name

	if Rails.env.development?
	  has_attached_file :photo, :styles => { :small => "150x150>" },
	                  :url  => "/assets/products/:id/:style/:basename.:extension",
	                  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"
	elsif Rails.env.production?
  	has_attached_file :photo, :styles => { :thumb => '40x40#', :medium => '150x200>', :large => '300x300>'},
                    :convert_options => { :thumb => "-quality 92", :medium => "-quality 92", :large => "-quality 92"  },
                    :storage => :s3,
								    :s3_credentials => {
								      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
								      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
								    }
	end

	validates_attachment_presence :photo
	validates_attachment_size :photo, :less_than => 5.megabytes
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
end
