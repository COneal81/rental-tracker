class CreateSupplies < ActiveRecord::Migration[6.0]
  def change
    create_table :supplies do |t|
      t.string :supply_name

      t.timestamps
    end
  end
end
