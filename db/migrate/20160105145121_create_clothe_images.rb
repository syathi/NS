class CreateClotheImages < ActiveRecord::Migration
  def change
    create_table :clothe_images do |t|
      t.references :clothe, null: false
      t.binary :data
      t.string :content_type
      t.timestamps null: false
    end

    add_index :clothe_images, :clothe_id
  end
end
