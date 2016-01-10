class Admin < ActiveRecord::Base
	validates :password, presence: {on: :create }, confirmation: { allow_blank: true}
	#validates :new_password, presence: {on: :update }, confirmation: true
	validates_confirmation_of :new_password #_confirmationがつく疑似カラムを召還する
	
	attr_accessor :password, :password_confirmation
	attr_accessor :new_password

	def password=(val)#パスワードを暗号化するメソッド
		if val.present?
			self.adminPass = BCrypt::Password.create(val)
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

		def check_secret_ques(secret_ques, secret_ans)
			admin = Admin.find(1)
			if(admin.secretQues == secret_ques && admin.secretAns == secret_ans)then
				admin
			else
				nil
			end
		end
	end

end
