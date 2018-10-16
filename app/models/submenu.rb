class Submenu < ApplicationRecord

	has_many :menuitems, :dependent => :destroy
	
	scope :alphabetical, -> { order(:title) }

end
