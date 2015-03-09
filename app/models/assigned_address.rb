class AssignedAddress < ActiveRecord::Base
 belongs_to :address_verification
 belongs_to :tab
end
