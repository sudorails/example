class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.integer :user_id
      t.integer :reference_id, default: 1
      t.string :slug
      t.string :request_id
      t.integer :verification_type_id
      t.string :status
      t.integer :user_id
      t.string :father_name
      t.date :dob
      t.string :location
      t.text :address
      t.timestamps null: false
    end
  end
end
