class Admin < ActiveRecord::Base
	attr_accessible :image, :remote_image_url
	validates_presence_of :title
	mount_uploader :image, ImageUploader
end
