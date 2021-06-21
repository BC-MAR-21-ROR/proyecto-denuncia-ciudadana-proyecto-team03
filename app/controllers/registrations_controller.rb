class RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end

  def after_inactive_sign_up_path_for(_resource)
    new_user_session_path
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
