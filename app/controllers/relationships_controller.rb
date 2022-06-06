class RelationshipsController < ApplicationController
  # def create
  #   current_user.follow(params[:user_id])
  #   redirect_back(fallback_location: root_path)
  # end
  def create
     following = current_user.follow(params[:user_id])
     # current_user.follow(params[:user_id])
     if following.save
       flash[:success] = 'ユーザーをフォローしました'
      # redirect_to @user
       redirect_back(fallback_location: root_path)
     else
       flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      # redirect_to @user
       redirect_back(fallback_location: root_path)
     end
  end
  # フォロー外すとき
  # def destroy
  #   current_user.unfollow(params[:user_id])
  #   redirect_back(fallback_location: root_path)  
  # end
  def destroy
     following = current_user.unfollow(params[:user_id])
     if following.destroy
       flash[:success] = 'ユーザーのフォローを解除しました'
      # redirect_to @user
      redirect_back(fallback_location: root_path)
     else
       flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      # redirect_to @user
      redirect_back(fallback_location: root_path)
     end
  end
  
  # フォロー一覧
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end
  # フォロワー一覧
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
  
end