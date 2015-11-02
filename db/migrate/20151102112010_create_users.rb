class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name, null: false
      t.string :password, null: false
      t.string :email, null: false, unique: true
    end
  end
end