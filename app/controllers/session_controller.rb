class SessionController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    # if  user && user.authenticate(params[:password])
    if user.nil?
      @login_error = "Email not found"
      flash[:error] = "Sorry, we can't find that email address"
      render :new
    elsif user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      @login_error = "Incorrect password"
      flash[:error] = "Sorry, that's not the correct password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end