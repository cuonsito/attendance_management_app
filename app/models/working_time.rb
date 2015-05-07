class WorkingTime < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  validates :user_id,    presence: true
  validates :project_id, presence: true
  # validates :approval,   presence: true
  validates :time, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 8 }
  validates :date, presence: true, uniqueness: { scope: [:user_id, :project_id] }
end
