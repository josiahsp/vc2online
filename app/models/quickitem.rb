class Quickitem < ApplicationRecord

	require 'carrierwave/processing/mini_magick'
	
	mount_uploader :cover_image, ImageUploader

	validates_presence_of :title, :path, :order, :cover_image

	scope :ordered, -> { order(order: :desc )}

end
