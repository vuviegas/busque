class PassengerTripsController < ApplicationController
  # before_action :set_bus_travel, only: [:new, :create]

  def new
    @passenger_trip = PassengerTrip.new

    if params[:travel_line].present?
      @travel_line = TravelLine.find(params[:travel_line])
      @bus_travels = BusTravel.where(travel_line: @travel_line).map {|u| ["#{u.departure_on.strftime('%d/%m/%Y')} - Linha #{u.travel_line.identification_number} - #{u.travel_line.origin} - #{u.travel_line.destination}", u.id]}
    end
  end

  def create
    if params[:travel_line]
      redirect_to new_passenger_trip_path(@bus_travel, travel_line: params[:travel_line])
    else
      @passenger = Passenger.new(passenger_params['passenger'])
      @passenger.save

      @passenger_trip = PassengerTrip.new(passenger_trip_params)
      @passenger_trip.passenger = @passenger
      @passenger_trip.bus_travel_id = params[:passenger_trip][:bus_travel]
      @passenger_trip.save

      redirect_to bus_travel_path(@passenger_trip.bus_travel)
    end
  end

  def delete
    @passenger_trip = PassengerTrip.find(params[:id])
    @passenger_trip.destroy

    redirect_to
  end

  private

  def set_bus_travel
    @bus_travel = BusTravel.find(params[:bus_travel_id])
  end

  def passenger_trip_params
    params.require(:passenger_trip).permit(:seat, :arrival_spot)
  end

  def passenger_params
    params.require(:passenger_trip).permit(passenger: [
                                              :full_name,
                                              :date_of_birth,
                                              :gender,
                                              :cpf,
                                              :identification_number,
                                              :identification_state
                                            ])
  end
end
