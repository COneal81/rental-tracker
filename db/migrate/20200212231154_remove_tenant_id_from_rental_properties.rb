class RemoveTenantIdFromRentalProperties < ActiveRecord::Migration[6.0]
  def change
    remove_column :rental_properties, :tenant_id
  end
end
