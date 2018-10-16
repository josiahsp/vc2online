class Image < ApplicationRecord

  require 'carrierwave/processing/mini_magick'
  
  mount_uploader :image, ImageUploader
  
  #validations
  validates_presence_of :image, :title
  
  
  #scopes
  scope :newest, -> { order(created_at: :desc) }
  scope :alphabetical, -> { order(:title) }
  
end
