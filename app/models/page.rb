class Page < ApplicationRecord

	extend FriendlyId
	friendly_id :title, use: :slugged

	mount_uploader :hero_image, HeroUploader
	mount_uploader :hero_square_image, ImageUploader
	mount_uploader :cover_image, ImageUploader
	mount_uploader :thumbnail_image, ImageUploader

end
