class Favorite < ActiveRecord::Base
    belongs_to :user
    belongs_to :product_id
end