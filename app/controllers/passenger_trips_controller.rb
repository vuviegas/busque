class PassengerTripsController < ApplicationController
  before_action :set_bus_travel, only: [:new, :create]

  def new
    @passenger_trip = PassengerTrip.new
    # company = Company.where(user_id: current_user.id)
    # @travel_line = TravelLine.where(company_id: company.ids)
  end

  # def create
  #   @passenger_trip = PassengerTrip.new(passenger_trip_params)
  #   @passenger_trip.bus_travel = @bus_travel
  #   @passenger_trip.save

  #   redirect_to bus_travel_path(@bus_travel)
  # end

  private

  def set_bus_travel
    @bus_travel = BusTravel.find(params[:bus_travel_id])
  end

  def passenger_trip_params
    params.require(:passenger_trip).permit(:seat, :bus_travel_id, :pasenger_id)
  end
end
