class UsersController < ApplicationController

  before_action :load_user, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
     @user = User.new
  end 

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end


  private

    def load_user
      @user = User.find(params[:id])
    end


    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :gender, :dob, :photo_url, :created_at, :updated_at)
    end

end