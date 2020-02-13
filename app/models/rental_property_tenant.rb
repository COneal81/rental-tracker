class RentalPropertyTenant < ApplicationRecord
    belongs_to :rental_property
    belongs_to :tenant
end
