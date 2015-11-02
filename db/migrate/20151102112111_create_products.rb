class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :description, null: false
      t.integer :user_id, null: false
    end
  end
end