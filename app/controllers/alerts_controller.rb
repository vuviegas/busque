class AlertsController < ApplicationController
  def index
    if current_user.admin?
      @alerts = Alert.all
    elsif current_user.police?
      @alerts = Alert.where(user_id: current_user.id)
    else
      forbidden
    end
  end

  def new
    if current_user.admin? || current_user.police?
      @alert = Alert.new
    else
      forbidden
    end
  end

  def create
    if current_user.admin? || current_user.police?
      @alert = Alert.new(alert_params)
      if @alert.save
        redirect_to alerts_path, notice: "Alerta criado com sucesso!"
      else
        render :new
      end
    else
      forbidden
    end
  end

  private

  def forbidden
    redirect_to root_path, alert: "Você não pode realizar esta ação."
  end

  def alert_params
    params.require(:alert).permit(:felony, :description, :level, :solved, :passenger_id, :user_id)
  end
end
