class User < ActiveRecord::Base

	has_secure_password

	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

	validates :first_name, :last_name, 
							presence: true

	validates :username,	presence: true,
							uniqueness: { case_sensitive: false }
							
	validates :email, 		presence: true, 
							uniqueness: { case_sensitive: false }, 
							format: { with: EMAIL_REGEX }

	validates :password, 	presence: true, 
							confirmation: true

end
