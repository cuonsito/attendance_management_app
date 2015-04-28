class Member < ActiveRecord::Base
	validates :user_id,     presence: true
  validates :project_id,  presence: true
  validates :assain_rate, presence: true, numericality: { greater_than_or_equal_to: 0,
  																											  less_than_or_equal_to: 1 }
end
