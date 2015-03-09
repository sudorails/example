class Tab < ActiveRecord::Base
	validates_presence_of :name, :tab_code
  has_one :user
  has_many :customer_verifications
end
