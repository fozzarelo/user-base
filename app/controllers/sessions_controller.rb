class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email params[:email]
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_show_path, notice: "logged in"
    else
      flash[:alert] = "Wrong email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "logged out"
  end

end
