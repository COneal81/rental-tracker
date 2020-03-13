class Supply < ApplicationRecord
     # has_many :rental_properties - changed when adding supplies
     # has_many :users, through: :rental_properties - changed when adding supplies

     belongs_to :user
     belongs_to :repair
end
