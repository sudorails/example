class CreateCustomerVerifications < ActiveRecord::Migration
  def change
    create_table :customer_verifications do |t|
      t.integer :tab_id
      t.integer :customer_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
