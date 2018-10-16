class Prayer < ApplicationRecord
	include PrayersHelper
	require 'net/http'
	require 'uri'
	
	validates_presence_of :title, :details, :scripture_1
	
	scope :active, -> { where("active = true") }
end
