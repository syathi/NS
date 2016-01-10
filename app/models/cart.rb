class Cart < ActiveRecord::Base
   has_many :clothes
   has_one :reservations
   has_many :users
end
