class AddSeatnumberToEducationVerifications < ActiveRecord::Migration
  def change
    add_column :education_verifications, :seat_number, :string
  end
end
