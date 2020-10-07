class TravelLinesController < ApplicationController
  def index
    if current_user.admin? || current_user.police?
      @travel_lines = TravelLine.all.paginate(
        :page => params[:page], :per_page => 10)
    elsif current_user.clerk?
      @travel_lines = TravelLine.joins(:company).where(
        'user_id = ?', current_user.id).paginate(
        :page => params[:page], :per_page => 10)
    end
  end

  def new
    if current_user.admin?
      @travel_line = TravelLine.new
    else
      forbidden
    end
  end

  def create
    if current_user.admin?
      @travel_line = TravelLine.new(travel_line_params)
      if @travel_line.save
        redirect_to travel_lines_path, notice: "A linha de ônibus foi criada com sucesso!"
      else
        render :new
      end
    else
      forbidden
    end
  end

  def destroy
    if current_user.admin?
      @travel_line = TravelLine.find(params[:id])
      @travel_line.destroy

      redirect_to travel_lines_path
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
