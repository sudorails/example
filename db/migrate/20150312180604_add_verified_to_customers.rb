class AddVerifiedToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :verified, :boolean, :default => false
  end
end
