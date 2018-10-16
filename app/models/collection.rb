class Collection < ApplicationRecord

	has_many :multicasts

	mount_uploader :artwork, ImageUploader
	mount_uploader :hero_image, HeroUploader
	
	validates_presence_of :title, :startdate, :enddate, :description, :hero_image, :artwork
	validates_with CollectionValidator
	
	scope :chronological, -> { order('enddate desc') }
	scope :active, -> { where('startdate <= ?', (Time.now)) }
end
