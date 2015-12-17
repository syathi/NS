class CreateClothes < ActiveRecord::Migration
  def change
    create_table :clothes do |t|
      t.string :name
      t.integer :sex
      t.string :size
      t.string :color
      t.string :category1
      t.string :category2
      t.integer :state
      t.integer :value
      t.string :note
      t.boolean :recommend
      t.boolean :isLent
      t.timestamps null: false
    end
  end
end
