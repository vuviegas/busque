class TravelLine < ApplicationRecord
  belongs_to :company
  has_many :bus_travels, dependent: :destroy

  validates :identification_number,
            :origin,
            :destination,
            :departure_at,
            :arrival_at,
            :company_id,
            presence: true
end
