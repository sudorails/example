class Customer < ActiveRecord::Base
 has_one :crime_verification
 has_one :education_verification
 has_one :address_verification
 #has_one :assigned_address
 has_one :customer_verification
 belongs_to :verification_type
 belongs_to :user
 has_one :address_servey
 has_many :customer_documents
 accepts_nested_attributes_for :crime_verification, reject_if: proc { |attributes| attributes['father_name'].blank? }
 accepts_nested_attributes_for :address_verification, reject_if: proc { |attributes| attributes['father_name'].blank? }
 accepts_nested_attributes_for :education_verification, reject_if: proc { |attributes| attributes['seat_number'].blank? }
 accepts_nested_attributes_for :customer_documents# , :allow_nil => true
 after_create :customer_name_check, :on => :create
 #validates_uniqueness_of :request_id 

  include Workflow
  workflow_column :status

  workflow do
    state :pending do
      event :submit, :transitions_to => :completed
    end
    state :completed do
      event :review, :transitions_to => :reviewed
    end
    state :reviewed
  end


 extend FriendlyId
 friendly_id :name, use: :slugged

 def customer_name_check
 	self.name = 'no customer' if self.name.nil?
 end

end
