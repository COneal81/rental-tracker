class AddForeignKeysToTenants < ActiveRecord::Migration[6.0]
  def change
    add_column :tenants, :rental_property_id, :integer
  end
end
