class BusTravelsController < ApplicationController
  def index
    if current_user.admin? || current_user.police?
      @bus_travels = BusTravel.where(departure_on: Date.today)
    else
      company = Company.where(user_id: current_user.id)
      travel_lines = TravelLine.where(company_id: company.ids)
      @bus_travels = BusTravel.where(departure_on: Date.today, travel_line_id: travel_lines.ids)
    end
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
