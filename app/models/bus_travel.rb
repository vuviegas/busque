class BusTravel < ApplicationRecord
  belongs_to :travel_line
  has_many :passengers, through: :passenger_trips
  validates :departure_on, :arrival_on, :travel_line_id, presence: true


  def self.by_departure
    order('departure_on DESC')
  end
end
