class Repair < ApplicationRecord
    belongs_to :rental_property
    # belongs_to :supply, optional: true
    has_many :repair_supplies
    has_many :supplies, through: :repair_supplies
    

    # has_many :users, through: :supplies
    validates :repair_name, :repair_description, :rental_property_id, presence: true
  
   


    def supplies_attributes=(supply_attributes)
        supply_attributes.values.each do |supply_attribute|
            unless supply_attribute.blank?
                supply = Supply.find_or_create_by(supply_attribute)        
                self.supplies << supply
            end
        end
    end

end
