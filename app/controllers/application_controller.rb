class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def after_sign_out_path_for(resource)
    root_path
  end
  

  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys:[:email])
    end

    def login_check
      unless user_signed_in?
        flash[:alert] = "ログインしてください"
        redirect_to root_path
      end
    end

    
end
