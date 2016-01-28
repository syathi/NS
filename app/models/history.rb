class History < ActiveRecord::Base
	has_many :user
	#belongs_to :cart
	belongs_to :clothe

end
