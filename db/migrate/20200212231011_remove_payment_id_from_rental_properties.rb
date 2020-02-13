class RemovePaymentIdFromRentalProperties < ActiveRecord::Migration[6.0]
  def change
    remove_column :rental_properties, :payment_id
  end
end
