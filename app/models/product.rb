class Product < ActiveRecord::Base
    belongs_to 	:user
    has_many 		:favorites
    has_many 		:users, :through => :favorites
end