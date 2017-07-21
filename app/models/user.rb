class User < ActiveRecord::Base
	has_many :articles
	before_save { self.email = email.downcase }
	validates :username, presence: true, 
			   #uniqueness: { case_sensitive: false },
			   length: { minimum: 3, maximum: 25 }

	VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, presence: true,
			      length: { maximum: 150 },
			      uniqueness: { case_sensitive: false },
			      format: { with: VALID_EMAIL_REGEX }

	VALID_PASSWORD_REGEX= /\w/
	validates :password_digest, presence: true, on: :create,
				length: {minimum: 6, maximum:15},
				format: { with: VALID_PASSWORD_REGEX }

	#has_secure_password
end