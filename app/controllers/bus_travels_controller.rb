class BusTravelsController < ApplicationController

  def index
    # Filtros por tipo de usuário serão implementados aqui
    @bus_travels = BusTravel.all
  end

  def new
    @company = Company.find(params[:company_id])
    @travel_line = TravelLine.find(params[:travel_line_id])
    @bus_travel = BusTravel.new
  end

  def create
    @bus_travel = BusTravel.new(bus_travel_params)
    if @bus_travel.save

      redirect_to new_company_travel_line_bus_travel_path, notice: "A viagem foi criada com sucesso!"
    else
      render :new
    end
  end

  def destroy
    bus_travel = BusTravel.find(params[:id])
    bus_travel.destroy

    redirect_to authenticated_root_path
  end

  private

  def bus_travel_params
    params.require(:bus_travel).permit(:departure_on, :arrival_on, :travel_line_id)
  end
end
