class Clothe < ActiveRecord::Base
	validates_acceptance_of :confirming
	after_validation :check_confirming

	def check_confirming
    	errors.delete(:confirming)
    	self.confirming = errors.empty? ? '1' : ''
	end
end
