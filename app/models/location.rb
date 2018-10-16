class Location < ApplicationRecord

	extend FriendlyId
	friendly_id :title, use: :slugged

	has_many :meetings
	
<<<<<<< HEAD
	validates_presence_of :title, :address, :city, :state, :zip, :phone, :leader, :googlemapsid, :hero_image, :hero_square_image, :cover_image, :thumbnail_image
	validates_uniqueness_of :title, :googlemapsid
	
	mount_uploader :hero_image, HeroUploader
	mount_uploader :hero_square_image, ImageUploader
	mount_uploader :cover_image, ImageUploader
	mount_uploader :thumbnail_image, ImageUploader
	
=======
>>>>>>> be4d248d05bb7a93b47eccdce1d4c49a57e15414
end
