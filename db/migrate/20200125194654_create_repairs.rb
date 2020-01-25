class CreateRepairs < ActiveRecord::Migration[6.0]
  def change
    create_table :repairs do |t|
      t.string :repair_name
      t.boolean :repair_needed, default: true
      t.text :repair_description
      t.integer :repair_cost
      t.boolean :repair_completed, default: false 
      t.integer :rental_property_id

      t.timestamps
    end
  end
end
