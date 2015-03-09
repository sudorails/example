class CreateAssignedAddresses < ActiveRecord::Migration
  def change
    create_table :assigned_addresses do |t|
      t.integer :tab_id
      t.integer :user_id
      t.integer :customer_id

      t.timestamps null: false
    end
  end
end
