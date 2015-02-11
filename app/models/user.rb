class User < ActiveRecord::Base
	has_secure_password
	
	validates :name, presence: true,
	:format => { with: /\A[a-zA-Z\s]+$\z/ }

	validates :email, presence: true, uniqueness: true,
	:format => { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}

	validates :password, :length => {:minimum => 6}

	validates :password_confirmation, presence: true

end
