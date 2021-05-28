class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username])
    end

    def authenticate_user?
      redirect_to root_path unless user_signed_in? && current_user.is_user?
    end

    def authenticate_admin?
      redirect_to root_path unless user_signed_in? && current_user.is_admin?
    end
end
