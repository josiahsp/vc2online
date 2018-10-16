class Link < ApplicationRecord

	extend FriendlyId
	friendly_id :title, use: :slugged

	validates_presence_of :title, :destination

	scope :alphabetical, -> { order(slug: :asc) }

end
