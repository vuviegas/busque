class TravelLine < ApplicationRecord
  belongs_to :company
  has_many :bus_travels, dependent: :destroy
  has_many :passenger_trips, through: :bus_travels
  has_many :passengers, through: :passenger_trips

  validates :identification_number,
            :origin,
            :destination,
            :departure_at,
            :arrival_at,
            :company_id,
            presence: true

  def self.by_identification_number
    order('identification_number DESC')
  end
end
