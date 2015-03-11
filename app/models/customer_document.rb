class CustomerDocument < ActiveRecord::Base
	has_attached_file :document, :styles => { :thumb => "100x100"}
	validates_attachment_presence :document
	validates_attachment_size :document, :less_than => 5.megabytes
	validates_attachment_content_type :document, :content_type => ['image/jpeg', 'application/pdf']
end
