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
      @passenger = Passenger.where(passenger_params)

      if @passenger.exists?
        @passenger_trip = PassengerTrip.new(passenger_trip_params)
        @passenger_trip.passenger_id = @passenger.ids.first
        @passenger_trip.bus_travel_id = params[:passenger_trip][:bus_travel]
        if @passenger_trip.save
          redirect_to bus_travel_path(@passenger_trip.bus_travel)
        else
          render :new
        end
      else
        @new_passenger = Passenger.new(passenger_params)

        if @new_passenger.save
          @passenger_trip = PassengerTrip.new(passenger_trip_params)
          @passenger_trip.passenger = @new_passenger
          @passenger_trip.bus_travel_id = params[:passenger_trip][:bus_travel]
          if @passenger_trip.save
            redirect_to bus_travel_path(@passenger_trip.bus_travel)
          else
            render :new
          end
        else
          render :new
        end
      end
    end
  end

  def delete
    raise
    @bus_travel = BusTravel.find(parmas[:id])
    @passenger_trip = PassengerTrip.where(passenger_trip_passenger: @passenger)
    if current_user == @passenger_trip.user || current_user.admin?
      @passenger_trip.destroy

      redirect_to bus_travel_path(@bus_travel)
    end
  end

  def destroy
    @passenger_trip = PassengerTrip.find(params[:id])
    if current_user == @passenger_trip.bus_travel.travel_line.company.user || current_user.admin?
      @passenger_trip.destroy
      redirect_to bus_travel_path(@passenger_trip.bus_travel)
    end
  end

  private

  def set_bus_travel
    @bus_travel = BusTravel.find(params[:bus_travel_id])
  end

  def passenger_trip_params
    params.require(:passenger_trip).permit(:seat, :arrival_spot)
  end

  def passenger_params
    params.require(:passenger_trip).require(:passenger).permit(
                                                           :full_name,
                                                           :date_of_birth,
                                                           :gender,
                                                           :cpf,
                                                           :identification_number,
                                                           :identification_state)
  end
end

# => Antigo código de passenger_params
# params.require(:passenger_trip).permit(passenger: [
#                                           :full_name,
#                                           :date_of_birth,
#                                           :gender,
#                                           :cpf,
#                                           :identification_number,
#                                           :identification_state])

# => Antigo código em create para localizar passageiro (o que é
# => feito atualmente pelo passenger_params)
# @passenger = Passenger.where(
#   full_name: params[:passenger_trip][:passenger][:full_name],
#   date_of_birth: params[:alert][:passenger][:date_of_birth],
#   gender: params[:alert][:passenger][:gender],
#   cpf: params[:alert][:passenger][:cpf],
#   identification_number: params[:alert][:passenger][:identification_number],
#   identification_state: params[:alert][:passenger][:identification_state]
#   )
