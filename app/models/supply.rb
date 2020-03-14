class Supply < ApplicationRecord
     # has_many :rental_properties - changed when adding supplies
     # has_many :users, through: :rental_properties - changed when adding supplies

     # belongs_to :user
     # belongs_to :repair, optional: true
     has_many :repair_supplies
     has_many :repairs, through: :repair_supplies

     # has_many :repairs
     # has_many :rental_properties, through: :repairs
     # validates :supply_name, presence: true
end
