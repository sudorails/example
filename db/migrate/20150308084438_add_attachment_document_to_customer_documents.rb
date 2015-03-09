class AddAttachmentDocumentToCustomerDocuments < ActiveRecord::Migration
  def self.up
    change_table :customer_documents do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :customer_documents, :document
  end
end
