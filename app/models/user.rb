class User < ActiveRecord::Base
  has_many :members, dependent: :destroy
  has_many :projects, through: :members
  has_many :working_times, dependent: :destroy
  validates :username, presence: true, length: { maximum: 20 }
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
  #                   uniqueness: { case_sensitive: false }
  # validates :password, length: { minimum: 6 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:username]
end
