class TravelLinesController < ApplicationController
  def index
    if current_user.admin? || current_user.police?
      @travel_lines = TravelLine.all
    elsif current_user.clerk?
      @travel_lines = TravelLine.where(company_id: params[:company_id])
    end
  end

  def new
    if current_user.admin?
      @company = Company.find(params[:company_id])
      @travel_line = TravelLine.new
    else
      forbidden
    end
  end

  def create
    if current_user.admin?
      @travel_line = TravelLine.new(travel_line_params)
      if @travel_line.save
        redirect_to company_travel_lines_path, notice: "A linha de ônibus foi criada com sucesso!"
      else
        render :new
      end
    else
      forbidden
    end
  end

  def destroy
    if current_user.admin?
      travel_line = TravelLine.find(params[:id])
      travel_line.destroy
      @company = travel_line.company

      redirect_to company_travel_lines_path(@company)
    else
      forbidden
    end
  end

  private

  def travel_line_params
    params.require(:travel_line).permit(:identification_number, :origin, :destination, :departure_at, :arrival_at, :company_id)
  end

  def forbidden
    redirect_to root_path, alert: "Você não pode realizar esta ação."
  end
end
