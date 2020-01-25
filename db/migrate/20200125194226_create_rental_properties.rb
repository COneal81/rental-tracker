class CreateRentalProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :rental_properties do |t|
      t.string :property_name
      t.text :property_description
      t.string :address
      t.integer :monthly_rental_amount
      t.integer :deposit_amount
      t.integer :square_feet
      t.boolean :leased, default: false
      t.string :contract_start_date
      t.string :contract_end_date
      t.integer :user_id
      t.string :image_url
      t.integer :tenant_id
      t.integer :payment_id

      t.timestamps
    end
  end
end
