class BusTravel < ApplicationRecord
  belongs_to :travel_line
  has_many :passenger_trips, dependent: :destroy
  # has_many :passengers, through: :passenger_trips # <= Silenciar para resolver problema do destroy de travel line

  validates :departure_on, :arrival_on, :travel_line_id, presence: true

  def self.by_departure
    order('departure_on DESC')
  end
end
