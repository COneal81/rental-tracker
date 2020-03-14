class RepairSupply < ApplicationRecord
    belongs_to :repair 
    belongs_to :supply 
end
