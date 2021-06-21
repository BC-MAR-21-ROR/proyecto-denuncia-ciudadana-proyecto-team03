class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pagy::Backend
  around_action :switch_locale

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :avatar])
  end

  def authenticate_user?
    redirect_to root_path unless user_signed_in? && current_user.is_user?
  end

  def authenticate_admin?
    redirect_to root_path unless user_signed_in? && current_user.is_admin?
  end

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
