class PassengersController < ApplicationController

  # def show
  #   @passenger = passenger.find(params[:id])
  # end

  def new
    # @travel_line = TravelLine.find(travel_line_id: bus_travel.travel_line.travel_line_id)
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(passenger_params)
    if @passenger.save
      redirect_to passenger_path, notice: "Passageiro cadastrado com sucesso!"
    else
      render :new
    end
  end

  # def destroy
  #   @passenger = passenger.find(params[:id])
  #   @passenger.destroy
  #   redirect_to companies_path
  # end

  private

  def passenger_params
    params.require(:passenger).permit(:full_name, :date_of_birth, :gender, :cpf, :identification_number, :identification_state)
  end
end
