class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery #追記

  def after_sign_in_path_for(resource)
      flash[:notice] = "Signed in successfully."
      user_path(current_user)
  end

  def after_sign_out_path_for(resource)
    flash[:notice] = "Signed out successfully."
    root_path
  end
  
  
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
  
  def move_to_signed_in
    unless user_signed_in?
      #サインインしていないユーザーはログインページが表示される
      redirect_to new_user_session_path
    end
  end
  
end
