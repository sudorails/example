class CreateAddressServeys < ActiveRecord::Migration
  def change
    create_table :address_serveys do |t|
      t.integer :user_id
      t.integer :customer_id
      t.integer :tab_id
      t.boolean :accept_or_decline
      t.string :agency_name
      t.date :date_of_visit
      t.boolean :marital_status
      t.string :person_contacted

      t.timestamps null: false
    end
  end
end
