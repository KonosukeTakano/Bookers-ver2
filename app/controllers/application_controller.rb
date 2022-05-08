class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery #追記
  
  def after_sign_in_path_for(resource)
    books_path
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
