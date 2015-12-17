class Admin < ActiveRecord::Base
	attr_accessor :password, :password_confirmation

	def password=(val)#パスワードを暗号化するメソッド
		if val.present?
			self.adminPass = BCrypt::Password.create(val)
		end
		@password = val
	end
	
	class << self
		def authenticate(password)
			if(self.adminPass == password || BCrypt::Password.new(self.adminPass) == password)then
				admin
			else
				nil
			end
		end
	end
end
