class Multicast < ApplicationRecord

	attr_accessor :duration1, :duration2, :duration3
	
	belongs_to :collection

	mount_uploader :hero_image, HeroUploader
	mount_uploader :cover_image, ImageUploader
	mount_uploader :audio, MulticastUploader
	mount_uploader :video, MulticastUploader
	
	validates_presence_of :title, :author, :summary, :pubdate, :hero_image, :cover_image
	validates_uniqueness_of :guid
	validates_with MulticastValidator
	
	before_validation :set_guid
	before_validation :set_duration
	
	def set_guid
		if self.guid == ""
			new_guid = "#{self.title.titlecase.gsub(/[^a-zA-Z0-9]/i, '')}#{self.pubdate.strftime("%d%m%Y")}"
			self.guid = new_guid
		end
	end
	
	def set_duration
		self.duration = ((self.duration1.to_i * 360) + (self.duration2.to_i * 60) + self.duration3.to_i)
	end	
	
	scope :chronological, -> { order(pubdate: :desc) }
	scope :published, -> { where(:pubdate < Time.now) }
	
end
