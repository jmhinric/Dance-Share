class CompaniesController < ApplicationController

  before_action :load_user, only: [:create]
  before_action :load_company, only: [:show]
  before_action :authenticate, only: [:new, :create]

  def show
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.create(company_params)
    @company.admin_id = current_user.id
    @company.save
    @user.is_admin = true
    @user.save
    redirect_to company_path(@company)
  end



  private

  def company_params
    params.require(:company).permit(:name, :photo_url)
  end

  def load_company
    @company = Company.find(params[:id])
  end

  def load_user
    @user = current_user
  end

end