class AddressVerification < ActiveRecord::Base
 belongs_to :customer
 has_one :assigned_address  
end
