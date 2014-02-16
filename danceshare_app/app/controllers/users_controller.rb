class UsersController < ApplicationController

  before_action :load_user, only: [:show, :edit, :update, :destroy, :reviews_index]

  before_action :authenticate, :authorize, only: [:edit, :update, :destroy]

  def show
  end

  def new
     @user = User.new
  end 

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  def reviews_index
  end


  private

    def load_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :gender, :dob, :photo_url, :created_at, :updated_at)
    end

    def authenticate
      unless logged_in?
        redirect_to login_path
      end
    end

    def authorize
      if current_user != @user && !logged_in?
        redirect_to login_path
      elsif current_user != @user
        redirect_to root_path
      end
    end

end