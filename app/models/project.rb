class Project < ActiveRecord::Base
  has_many :members, dependent: :destroy
  has_many :users, through: :members
  has_many :working_times, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
