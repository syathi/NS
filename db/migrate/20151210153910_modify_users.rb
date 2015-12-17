class ModifyUsers < ActiveRecord::Migration
  def change
  	add_column :users, :freeze, :boolean
  	rename_column :users, :freeze, :isFreeze
  end
end
