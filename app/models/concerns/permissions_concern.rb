module PermissionsConcern
  extend ActiveSupport::Concern

  def is_admin?
    self.user_type == "administrator"
  end

  def is_user?
    self.user_type == "user"
  end

end