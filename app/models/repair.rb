class Repair < ApplicationRecord
    belongs_to :rental_property
    has_many :supplies
    has_many :users, through: :supplies
    validates :repair_name, :repair_description, :rental_property_id, presence: true
end
