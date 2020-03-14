class RemoveColumnFromRepairs < ActiveRecord::Migration[6.0]
  def change

    remove_column :repairs, :supply_id, :integer
  end
end
