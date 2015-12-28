class Staff < ActiveRecord::Base
	validates_confirmation_of :new_staff_password

	attr_accessor :password
	attr_accessor :new_staff_password

	def password=(val)
		if val.present?
			self.staff_pass = BCrypt::Password.create(val)
		end
		@password = val
	end

	class << self

		def authenticate(password)
			staff = find_by(1)
			if(staff && staff.staff_pass.present? && BCrypt::Password.new(staff.staff_pass) == password) then
				staff
			else
				nil
			end
		end
		
	end
end
