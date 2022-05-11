class UsersController < ApplicationController
  
  def index
    @users = User.all
    @user = User.new
    
  end

  def show
    @user = User.find(params[:id])
    @profile_image = @user.profile_image
  end

  def edit
    @user = User.find(params[:id])
    @users = User.all
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    
    if @user.save
      flash[:notice] = "User was successfully updated."
    redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
