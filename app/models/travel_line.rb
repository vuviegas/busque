class TravelLine < ApplicationRecord
  belongs_to :company
  has_many :bus_travels, dependent: :destroy
  # has_many :passenger_trips, through: :bus_travels
  # has_many :passengers, through: :passenger_trips <= Desligado após testar que form the passenger_trip consegue puxar travel_line sem probelmas

  validates :identification_number,
            :origin,
            :destination,
            :departure_at,
            :arrival_at,
            :company_id,
            presence: true
end
