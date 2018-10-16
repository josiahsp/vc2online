class Youversion < ApplicationRecord

	validates_presence_of :title, :eventnumber, :start
	validates_uniqueness_of :eventnumber, :start
	
	
	scope :ordered, -> { order(start: :desc) }
	scope :reverseordered, -> { order(start: :asc) }
	scope :current, -> { where('start >= ?', Time.now) }
	scope :past, -> { where('start <= ?', Time.now) }

end
