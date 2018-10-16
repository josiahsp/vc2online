class Meeting < ApplicationRecord

	belongs_to :location
	belongs_to :service, optional: true
	
	# Scopes based on meeting types
	scope :in_partial, -> { where(level: 1) }
	scope :ordered_by_day_and_time, -> { order(:weekday, :time) }
	scope :location, lambda { |location| where(:location_id => location) }
	scope :titled, lambda { |title| where(:title => title) }
	scope :on_day, lambda { |weekday| where(weekday: Date::DAYNAMES.index(weekday)) }
	

end