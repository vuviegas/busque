require 'will_paginate/array'

class PagesController < ApplicationController
  def home
    if current_user.admin? || current_user.police?
      @bus_travels = BusTravel.includes(
        travel_line: :company, passenger_trips: { passenger: :alerts }
        ).where(departure_on: Date.today).sort_by(&:alerts).reverse.paginate(
        :page => params[:page], :per_page => 10)
    else
      company = Company.where(user_id: current_user.id)
      travel_lines = TravelLine.where(company_id: company.ids)
      @bus_travels = BusTravel.where(departure_on: Date.today, travel_line_id: travel_lines.ids).paginate(:page => params[:page], :per_page => 10)
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

# <div class="digg_pagination mt-3 d-flex justify-content-center ">
# <%#= will_paginate @bus_travels, :container => false %>
# </div>

# .paginate(:page => params[:page], :per_page => 10)
