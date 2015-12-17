class ModifyReservations < ActiveRecord::Migration
  def change
  	add_column :reservations, :isSend, :boolean
  	add_column :reservations, :sendAdress, :string
  end
end
