class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def new
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to users_path
      flash[:success] = "You have logged in successfullly!"
    else
      flash[:error] = "User doesn't exists!"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end