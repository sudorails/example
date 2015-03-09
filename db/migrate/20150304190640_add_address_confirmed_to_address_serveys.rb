class AddAddressConfirmedToAddressServeys < ActiveRecord::Migration
  def change
    add_column :address_serveys, :address_confirmed, :boolean
  end
end
