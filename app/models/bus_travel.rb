class BusTravel < ApplicationRecord
  belongs_to :travel_line

  validates :departure_on, :arrival_on, :travel_line_id, presence: true
end
