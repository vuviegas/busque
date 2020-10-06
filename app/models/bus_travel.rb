class BusTravel < ApplicationRecord
  # attr_accessor :alert
  belongs_to :travel_line
  has_many :passenger_trips, dependent: :destroy
  has_many :passengers, through: :passenger_trips # <= Silenciar para resolver problema do destroy de travel line

  validates :departure_on, :arrival_on, :travel_line_id, presence: true

  def self.by_departure
    order('departure_on DESC')
  end

  def alerts
    passenger_trips.count { |t| t.passenger.alerts.any? }
    # self.alert = true if warning
    # warning
  end

  def red_alerts
    passenger_trips.count { |t| t.passenger.alerts.where(level: 'red').exists? }
  end

  def no_alerts
    passenger_trips.count { |t| t.passenger.alerts.blank? }
  end
end

# alerts.where(level: 'yellow')
