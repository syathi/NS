class User < ActiveRecord::Base
	belongs_to :reservation
	belongs_to :cart
	validates :password, presence: { on: :create },
		confirmation: {allow_blank: true}
		
	attr_accessor :password, :password_conrirmation

	def password=(val)
		if val.present?
			self.hashed_password = BCrypt::Password.create(val)
		end
		@password = val
	end

	class << self

		def authenticate(mail, password)
			user = find_by(mail: mail)
			if(user && user.hashed_password.present? && BCrypt::Password.new(user.hashed_password) == password) then
				user
			else
				nil
			end
		end
		
	end

end
