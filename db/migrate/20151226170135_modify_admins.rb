class ModifyAdmins < ActiveRecord::Migration
  def change
  end

  def up
  	change_column :admins, :secretQues, :integer 
  end

  def down
  	change_column :admins, :secretQues, :string
  end
end
