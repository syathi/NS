class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :userId
      t.integer :clothesId
      t.date :returnDay
      t.date :sendDay
      t.string :sendAdress
      t.boolean :isSend

      t.timestamps null: false
    end
  end
end
