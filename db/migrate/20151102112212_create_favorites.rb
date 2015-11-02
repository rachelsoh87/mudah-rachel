class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :product_id, null: false
      t.integer :user_id, null: false
    end
  end
end