class BusTravelsController < ApplicationController
  def index
    if current_user.admin? || current_user.police?
      @bus_travels = BusTravel.all
    else
      company = Company.where(user_id: current_user.id)
      travel_lines = TravelLine.where(company_id: company.ids)
      @bus_travels = BusTravel.where(travel_line_id: travel_lines.ids)
    end
    if params[:query].present?
      @bus_travels = BusTravel.search_global(params[:query]).paginate(:page => params[:page], :per_page => 8)
    else
      @bus_travels = BusTravel.all.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def show
    @bus_travel = BusTravel.find(params[:id])
  end

  def new
    @bus_travel = BusTravel.new
  end

  def create
    @bus_travel = BusTravel.new(bus_travel_params)
    if @bus_travel.save

      redirect_to bus_travels_path, notice: "A viagem foi cadastrada com sucesso!"
    else
      render :new
    end
  end

  def destroy
    bus_travel = BusTravel.find(params[:id])
    bus_travel.destroy

    redirect_to bus_travels_path
  end

  private

  def bus_travel_params
    params.require(:bus_travel).permit(:departure_on, :arrival_on, :travel_line_id)
  end
end
