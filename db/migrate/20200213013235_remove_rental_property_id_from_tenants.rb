class RemoveRentalPropertyIdFromTenants < ActiveRecord::Migration[6.0]
  def change
    remove_column :tenants, :rental_property_id
  end
end
