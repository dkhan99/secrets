class User < ActiveRecord::Base
  has_secure_password
  has_many :secrets
  has_many :likes, dependent: :destroy
  has_many :secrets, through: :likes
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :name, presence: true, length: { in: 2..20 }
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
	# validates :age, presence: true, numericality: { greater_than: 10, less_than: 150}
	
	before_save do 
		self.email.downcase!
		# self.first_name.capitalize!
	end	
end
