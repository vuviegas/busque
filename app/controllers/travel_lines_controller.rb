class TravelLinesController < ApplicationController
  def index
    @travel_lines = TravelLine.all
  end

  def new
    @company = Company.find(params[:company_id])
    @travel_line = TravelLine.new
  end

  def create
    @travel_line = TravelLine.new(travel_line_params)
    if @travel_line.save
      redirect_to company_travel_lines_path, notice: "A linha de ônibus foi criada com sucesso!"
    else
      render :new
    end
  end

  def destroy
    @travel_line = TravelLine.find(params[:id])
    @company = @travel_line.company
    @travel_line.destroy

    redirect_to company_travel_lines_path(@company)
  end

  private

  def travel_line_params
    params.require(:travel_line).permit(:identification_number, :origin, :destination, :departure_at, :arrival_at, :company_id)
  end
end
