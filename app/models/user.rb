class User < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 20 }
	VALID_EMAIL_REGEX = /\A[-+.\w]+@(?:[-\w]+\.)+\[:alpha:]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
end
