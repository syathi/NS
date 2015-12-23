class ModifyUsers < ActiveRecord::Migration
  def change
  	add_column :users, :freeze, :boolean
  	rename_column :users, :freeze, :isFreeze
  	rename_column :users, :password, :hashed_password
  end
end
