class PassengersController < ApplicationController
  before_action :set_passenger, only: [:show, :update, :destroy]

  def index
    if params[:query].present?
      @passengers = Passenger.search_global(params[:query]).paginate(:page => params[:page], :per_page => 8)
    else
      @passengers = Passenger.all.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def show
    @passenger_trips = PassengerTrip.where(passenger: @passenger)
  end

  def cpf_check
    if current_user.admin? || current_user.police?
      @alert = Alert.new
    else
      forbidden
    end
  end

  def cpf_check_post

  end

  def new
    @passenger = Passenger.new
  end

  def create
    if current_user.admin? || current_user.police?
      @passenger = Passenger.new(passenger_params)
      @alert = Alert.new(alert_params)
      @alert.passenger = @passenger
      @alert.user = current_user
      @alert.solved = false
      if @passenger.save
        @alert.save
        redirect_to passenger_path(@passenger), notice: "Passageiro e alerta criados com sucesso!"
      else
        render :new
      end
    else
      forbidden
    end
  end

  def edit
    if current_user.admin? || current_user.police?
      @passenger = Passenger.find(params[:id])
    else
      forbidden
    end
  end

  def update
    if current_user.admin? || current_user.police?
      @passenger.update(passenger_params)
      @alert = Alert.new(alert_params)
      @alert.passenger_id = @passenger.id
      @alert.user_id = current_user.id
      if @alert.save
        redirect_to passenger_path(@passenger), notice: "Alerta criado com sucesso!"
      else
        render :new
      end
    else
      forbidden
    end
  end

  def destroy
    if current_user.admin?
      @passenger.destroy
      redirect_to passenger_path
    else
      forbidden
    end
  end

  private

  def forbidden
    redirect_to root_path, alert: "Você não pode realizar esta ação."
  end

  def passenger_params
    params.require(:passenger).permit(:full_name, :date_of_birth, :gender, :cpf, :identification_number, :identification_state)
  end

  def alert_params
    params.require(:passenger).require(:alert).permit(:felony, :description, :level)
  end

  def set_passenger
    @passenger = Passenger.find(params[:id])
  end
end
