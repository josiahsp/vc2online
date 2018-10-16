class Kioskitem < ApplicationRecord

	mount_uploader :cover_image, ImageUploader

	validates_presence_of :title, :path, :cover_image
	
	scope :active, -> { where("active = true AND starttime <= ? AND endtime >= ?", Time.now, Time.now) }
	scope :ordered, -> { order(:id) }

end
