class CompaniesController < ApplicationController
  def index
    if current_user.admin? || current_user.police?
      @companies = Company.all
    elsif current_user.clerk?
      @companies = Company.where(user_id: current_user.id)
    end
  end

  def new
    if current_user.admin?
      @company = Company.new
    else
      forbidden
    end
  end

  def create
    if current_user.admin?
      @company = Company.new(company_params)
      if @company.save
        redirect_to companies_path, notice: "A empresa foi criada com sucesso!"
      else
        render :new
      end
    else
      forbidden
    end
  end

  def destroy
    if current_user.admin?
      @company = Company.find(params[:id])
      @company.destroy

      redirect_to companies_path
    else
      forbidden
    end
  end

  private

  def company_params
    params.require(:company).permit(:company_name, :user_id)
  end

  def forbidden
    redirect_to root_path, alert: "Você não pode realizar esta ação."
  end
end
