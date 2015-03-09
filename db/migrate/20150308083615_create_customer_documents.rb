class CreateCustomerDocuments < ActiveRecord::Migration
  def change
    create_table :customer_documents do |t|
      t.string :doc_name
      t.integer :customer_id

      t.timestamps null: false
    end
  end
end
