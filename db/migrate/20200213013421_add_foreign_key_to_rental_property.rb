class AddForeignKeyToRentalProperty < ActiveRecord::Migration[6.0]
  def change
    add_column :rental_properties, :tenant_id, :integer
  end
end
