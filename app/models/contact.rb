class Contact < ApplicationRecord

	belongs_to :user, :foreign_key => 'archiver'

	validates_presence_of :fname, :lname, :email, :phone, :details
	validates :attendance, :growgroup, :dreamteam, inclusion: [true, false]
	validates_format_of :phone, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/, message: "must be 10 characters in length"
	
	scope :archived, -> { where(:archived => true) }
	scope :active, -> { where(:archived => false) }
	
end
