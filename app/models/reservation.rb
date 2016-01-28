class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :cart
	belongs_to :clothe

	validates :sendAdress, presence: true
	validates :clothe_id, presence: true
	validate :check_send_day
	validate :check_return_day
	validate :check_rental_term

  	validates_acceptance_of :confirming
  	after_validation :check_confirming


	#validates :, numericality: { only_integer: true}
	private
	def check_send_day
		if Date.today >= sendDay
			errors.add(:sendDay, "発送希望日は今日より後の日付にしてください")
		end
	end
	def check_return_day
		if sendDay >= returnDay
			errors.add(:returnDay, "返却予定日は発送希望日より後の日付にしてください")
		end
	end
	def check_rental_term
		day = sendDay >> 2
		if day < returnDay
			errors.add(:returnDay, "貸出期間は最大2ヶ月です")
		end
	end

	def check_confirming
    	errors.delete(:confirming)
    	self.confirming = errors.empty? ? '1' : ''
  	end
end
