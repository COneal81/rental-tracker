class Repair < ApplicationRecord
    belongs_to :rental_property

    validates :repair_name, :repair_description, :repair_cost, :rental_property_id, presence: true

  
end
