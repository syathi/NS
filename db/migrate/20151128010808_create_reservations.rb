class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :userId
      t.integer :clothesId
      t.date :returnDay
      t.date :sendDay

      t.timestamps null: false
    end
  end
end
