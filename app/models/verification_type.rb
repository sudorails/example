class VerificationType < ActiveRecord::Base
	has_many :customers
	validates_uniqueness_of :name
end
