class UsersController < ApplicationController

  def new
  	@user = User.new
  	respond_to do |format|
      format.js{}
    end
  end

  def unique_email
   @user = User.find_by_email(params[:user][:email])
   respond_to do |format|
    format.json { render :json => !@user }
  end
end

def create
 @user = User.new(user_params)
 if @user.valid? && @user.errors.blank?
  @user.save
  @success = true
else
  @success = false
end
redirect_to root_path 
end

private
def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
end
end
