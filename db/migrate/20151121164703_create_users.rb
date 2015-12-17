class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :adress
      t.string :tel
      t.string :mail
      t.string :secretques
      t.string :secretans

      t.timestamps null: false
    end
  end
end
