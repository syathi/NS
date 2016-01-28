class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.references :clothe
      t.references :user
      t.integer :userId
      t.integer :clothesId
      t.date :returnDay
      t.date :sendDay
      t.string :sendAdress
      t.boolean :isSend

      t.timestamps null: false
    end

    add_index :histories, :clothe_id
    add_index :histories, :user_id
  end
end
