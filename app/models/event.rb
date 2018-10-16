class Event < ApplicationRecord

<<<<<<< HEAD
	require 'carrierwave/processing/mini_magick'

	extend FriendlyId
	friendly_id :title, use: :slugged

=======
>>>>>>> be4d248d05bb7a93b47eccdce1d4c49a57e15414
	has_many :links
	has_many :images
	has_many :videos

	include ActiveModel::Validations
	belongs_to :location, optional: true
	
	mount_uploader :hero_image, HeroUploader
	mount_uploader :hero_square_image, ImageUploader
	mount_uploader :cover_image, ImageUploader
	mount_uploader :thumbnail_image, ImageUploader

	validates_presence_of :title, :synopsis, :content, :start, :endtime
<<<<<<< HEAD
	validates :title, length: { minimum: 2, maxiumum: 30 }, uniqueness: true
=======
	validates :title, length: { minimum: 2, maxiumum: 30 }
>>>>>>> be4d248d05bb7a93b47eccdce1d4c49a57e15414
	validates :synopsis, length: { minimum: 2, maximum: 300 }
	validates :price, numericality: { only_float: true }
	validates_with EventValidator
	
	#scopes
	scope :chronological, -> { order(:start) }
	scope :soon, -> { where('start < ?', (Time.now + 3.weeks)) }
	scope :later, -> { where('start > ?', (Time.now + 3.weeks)) }
<<<<<<< HEAD
	scope :current, -> { where('endtime > ?', Time.now) }
=======
>>>>>>> be4d248d05bb7a93b47eccdce1d4c49a57e15414
	
end
