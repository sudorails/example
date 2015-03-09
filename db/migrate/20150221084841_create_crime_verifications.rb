class CreateCrimeVerifications < ActiveRecord::Migration
  def change
    create_table :crime_verifications do |t|
      t.string :father_name
      t.date :dob
      t.string :location
      t.text :address_one
      t.text :address_two
      t.text :address_third
      t.integer :customer_id
      t.string :status

      t.timestamps null: false
    end
  end
end
