class User < ActiveRecord::Base
    has_many :products
    has_many :favorites
    has_many :products, :through => :favorites
end