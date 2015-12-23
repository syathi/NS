class Admin < ActiveRecord::Base
	validates :password, presence: {on: :create },
			 confirmation: { allow_blank: true}
	#validates :password_new, presence: {on: :create},
	#		  confirmation: { allow_blank: true}

	attr_accessor :password, :password_confirmation
	#attr_accessor :staff_password, :staff_password_confirmation
	#attr_accessor :password_new, :password_new_confirmation

	def password=(val)#パスワードを暗号化するメソッド
		if val.present?
			self.adminPass = BCrypt::Password.create(val)
			#self.staffPass = BCrypt::Password.create(staff)
		end
		@password = val
	end
	
	class << self
		def authenticate(password)
			admin = Admin.find(1)
			#ハッシュ化したパスワードが存在して且つ、ハッシュ化したパスのキーが入力された内容と一致した場合
			if(admin.adminPass.present? && BCrypt::Password.new(admin.adminPass) == password)then
				admin
			else
				nil
			end
		end
	end
end
