class RelationshipsController < ApplicationController
  
  before_action :set_user
  
  def create
     following = current_user.follow(params[:user_id])
     if following.save
       flash[:success] = 'ユーザーをフォローしました'
      # render 'relationships/create'
     else
       flash.now[:alert] = 'ユーザーのフォローに失敗しました'
       redirect_back(fallback_location: root_path)
     end
  end
  # フォロー外すとき
  def destroy
     following = current_user.unfollow(params[:user_id])
     if following.destroy
       flash[:success] = 'ユーザーのフォローを解除しました'
      # render 'relationships/destroy'
     else
       flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_back(fallback_location: root_path)
     end
  end

  # フォロー一覧
  def followings
    @user = User.find(params[:user_id])
    @users = user.followings
  end
  # フォロワー一覧
  def followers
    @user = User.find(params[:user_id])
    @users = user.followers
  end
  
  private
  def set_user
    @user = User.find(params[:user_id])
  end
  
end