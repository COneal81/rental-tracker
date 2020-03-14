class RemoveColumnFromSupplies < ActiveRecord::Migration[6.0]
  def change

    remove_column :supplies, :repair_id, :integer

    remove_column :supplies, :user_id, :integer
  end
end
