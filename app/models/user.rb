class User < ActiveRecord::Base
  has_many :products
  has_many :favorites
  has_many :products, :through => :favorites

  validates :email, uniqueness: true,
                    presence: true,
                    format: /[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,4}/,
                    length: { maximum: 100 }

  validates :password, presence: true

  def self.authenticate(email, password)
  	user = User.find_by(email: email)
	  	if user && user.password == password
	  		return user 
	  	end
  	return nil
  end
end