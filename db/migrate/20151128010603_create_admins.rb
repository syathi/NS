class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :adminPass
      t.string :staffPass
      t.string :secretQues
      t.string :secretAns
      
      t.timestamps null: false
    end
  end
end
