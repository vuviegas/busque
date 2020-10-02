class PassengerTrip < ApplicationRecord
  belongs_to :passenger
  belongs_to :bus_travel
  belongs_to :travel_line

  validates :bus_travel, uniqueness: { scope: :passenger }
  validates :seat, :passenger_id, :bus_travel_id, presence: true
  validates :seat, length: { is: 2 }
                    # message: "%{value} deve ter 2 caracteres" }
  # validates :seat, :identification_number, format: { with: /0-9]+#$/,
                  # message: "%{value} deve ter apenas números" }
end
