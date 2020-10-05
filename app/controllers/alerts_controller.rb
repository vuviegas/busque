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
    # raise
    if current_user.admin? || current_user.police?
      @passenger = Passenger.where(
        full_name: params[:alert][:passenger][:full_name],
        date_of_birth: params[:alert][:passenger][:date_of_birth],
        gender: params[:alert][:passenger][:gender],
        cpf: params[:alert][:passenger][:cpf],
        identification_number: params[:alert][:passenger][:identification_number],
        identification_state: params[:alert][:passenger][:identification_state]
        )

      if @passenger.exists?
        @alert = Alert.new(alert_params)
        @alert.passenger_id = @passenger.ids.first
        @alert.user_id = current_user.id
        @alert.solved = false
        if @alert.save
          redirect_to passenger_path(@alert.passenger), notice: "Alerta criado com sucesso!"
        else
          render :new
        end
      else
        @new_passenger = Passenger.new(passenger_params[:passenger])
        @alert = Alert.new(alert_params)
        @alert.passenger = @new_passenger
        @alert.user = current_user
        if @new_passenger.save
          @alert.save
          redirect_to passenger_path(@new_passenger), notice: "Passageiro e alerta criados com sucesso!"
        else
          render :new
        end
      end
    else
      forbidden
    end
  end

  def destroy
    @alert = Alert.find(params[:id])
    @alert.destroy

    redirect_to passenger_path(@alert.passenger)
  end

  private

  def forbidden
    redirect_to root_path, alert: "Você não pode realizar esta ação."
  end

  def alert_params
    params.require(:alert).permit(:felony, :description, :level)
  end

  def passenger_params
    params.require(:alert).permit(passenger: [
                                    :full_name,
                                    :date_of_birth,
                                    :gender,
                                    :cpf,
                                    :identification_number,
                                    :identification_state
                                    ])
  end
end
