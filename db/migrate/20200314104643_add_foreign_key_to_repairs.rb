class AddForeignKeyToRepairs < ActiveRecord::Migration[6.0]
  def change
    add_column :repairs, :supply_id, :integer
  end
end
