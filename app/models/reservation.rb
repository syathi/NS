class Reservation < ActiveRecord::Base
	has_many :user
	belongs_to :cart
	belongs_to :clothe

	validates :sendAdress, presence: true
	#validates :, numericality: { only_integer: true}
end
