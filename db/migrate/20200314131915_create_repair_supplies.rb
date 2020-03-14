class CreateRepairSupplies < ActiveRecord::Migration[6.0]
  def change
    create_table :repair_supplies do |t|
      t.integer :repair_id
      t.integer :supply_id

      t.timestamps
    end
  end
end
