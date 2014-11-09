class RegistrationsController < Devise::RegistrationsController
  def new
    flash[:alert] = t(:alert_only_admin_can_register_new_user)
    redirect_to root_path
  end

  def create
    flash[:alert] = t(:alert_only_admin_can_register_new_user)
    redirect_to root_path
  end
end