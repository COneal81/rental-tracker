class RentalProperty < ApplicationRecord
    belongs_to :user
    belongs_to :tenant
    belongs_to :payment 
    has_many :repairs
end
