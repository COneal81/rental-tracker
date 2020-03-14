class Supply < ApplicationRecord
     
     has_many :repair_supplies
     has_many :repairs, through: :repair_supplies

end
