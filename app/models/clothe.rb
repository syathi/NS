class Clothe < ActiveRecord::Base
	  has_one :reservation　
    has_one :history
  	belongs_to :cart
  	has_one :images, class_name:"ClotheImage",dependent: :destroy
  	accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, presence: true
  validates :sex, presence: true
  validates :size, presence: true
  validates :color, presence: true
  validates :value, presence: true
  validates :value, numericality: { only_integer: true, greater_than: 0}

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
