class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    include Pagy::Backend

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

    def after_sign_out_path_for(_resource_or_scope)
      new_user_session_path
    end

    def after_inactive_sign_up_path_for(_resource)
      new_user_session_path
    end
end
