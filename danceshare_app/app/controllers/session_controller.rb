class SessionController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    
    if  user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      @login_error = "Email and Password don't match"
      render :new
    end
  end

  def destroy

  end

end