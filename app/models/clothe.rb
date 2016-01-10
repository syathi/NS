class Clothe < ActiveRecord::Base
	  has_one :reservation　
  	belongs_to :cart
  	has_one :images, class_name:"ClotheImage",dependent: :destroy
  	accepts_nested_attributes_for :images, allow_destroy: true

	validates_acceptance_of :confirming
	after_validation :check_confirming

	def check_confirming
    	errors.delete(:confirming)
    	self.confirming = errors.empty? ? '1' : ''
	end

  	class << self
    	def search(query)
     		rel = order("id")
     		if query.present?
       			rel = rel.where("name LIKE ? OR note LIKE ?",
            	"%#{query}%","%#{query}%")
      		end
      		rel
    	end
  	end

end
