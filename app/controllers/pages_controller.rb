class PagesController < ApplicationController
  def home
    if current_user.admin? || current_user.police?
      @bus_travels = BusTravel.includes(
        travel_line: :company, passenger_trips: { passenger: :alerts }
        ).where(departure_on: Date.today).sort_by(&:alerts).reverse
    else
      company = Company.where(user_id: current_user.id)
      travel_lines = TravelLine.where(company_id: company.ids)
      @bus_travels = BusTravel.where(departure_on: Date.today, travel_line_id: travel_lines.ids)
    end
  end
end

# class PagesController < ApplicationController
#   def home
#     if current_user.admin? || current_user.police?
#       @passenger_trip_alerts = []
#       @default_passenger_trips = []
#       today_bus_travels = BusTravel.where(departure_on: Date.today)
#       today_bus_travels.each do |bus_travel|
#         bus_travel.passenger_trips.each do |passenger_trip|
#           if passenger_trip.passenger.alerts.exists?
#             @passenger_trip_alerts << passenger_trip
#           else
#             @default_passenger_trips << passenger_trip
#           end
#         end
#       end
#     else
#       company = Company.where(user_id: current_user.id)
#       travel_lines = TravelLine.where(company_id: company.ids)
#       @bus_travels = BusTravel.where(departure_on: Date.today, travel_line_id: travel_lines.ids)
#     end
#   end
# end
