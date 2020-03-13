class AddForeignKeysToSupplies < ActiveRecord::Migration[6.0]
  def change
    add_column :supplies, :user_id, :integer
    add_column :supplies, :repair_id, :integer
  end
end
