class Menuitem < ApplicationRecord

	belongs_to :submenu
	
	scope :alphabetical, -> { order(:title) }

end
