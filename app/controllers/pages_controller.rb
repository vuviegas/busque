class PagesController < ApplicationController
  def home
    if current_user.admin? || current_user.police?
      @bus_travels = BusTravel.where(departure_on: Date.today)
    else
      company = Company.where(user_id: current_user.id)
      travel_lines = TravelLine.where(company_id: company.ids)
      @bus_travels = BusTravel.where(departure_on: Date.today, travel_line_id: travel_lines.ids)
    end
  end
end
