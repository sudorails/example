class CreateEducationVerifications < ActiveRecord::Migration
  def change
    create_table :education_verifications do |t|
      t.string :stream
      t.integer :month
      t.integer :year
      t.integer :customer_id
      t.string :status

      t.timestamps null: false
    end
  end
end
