class CompaniesController < ApplicationController

  before_action :load_user, only: [:create]
  before_action :load_company, only: [:show, :edit, :update]
  before_action :authenticate, only: [:new, :create, :edit, :update]
  before_action :admin_authorize, only: [:edit, :update]

  def show
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.create(company_params)
    @company.admin = current_user
    # @company.admin_id = current_user.id
    @company.save
    # @user.is_admin = true
    # @user.save
    current_user.companies << @company
    redirect_to company_path(@company)
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to company_path(@company)  
    else
      render :edit
    end
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