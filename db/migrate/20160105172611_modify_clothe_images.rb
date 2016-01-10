class ModifyClotheImages < ActiveRecord::Migration
  def change
  	#remove_index :clothe_images, column: 'clothes_id'
  	#add_index :clothe_images, :clothe_id
  end
end
