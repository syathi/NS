class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :clothe
      t.references :user
      t.integer :userId
      t.integer :clothesId
      t.date :returnDay
      t.date :sendDay

      t.timestamps null: false
    end

    add_index :reservations, :clothe_id
    add_index :reservations, :user_id
  end
end
