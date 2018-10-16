class Service < ApplicationRecord

	has_many :meetings

	scope :ordered_by_priority, -> { order(priority: :asc) }

end
