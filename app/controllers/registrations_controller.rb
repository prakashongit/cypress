class RegistrationsController < Devise::RegistrationsController
  add_breadcrumb 'New Account', :new_user_registration_path, only: [:new, :create]
  add_breadcrumb 'Edit User', :edit_user_registration_path, only: [:edit, :update]
  add_breadcrumb 'Cancel Account', :cancel_user_registration_path, only: [:cancel]

  before_action :configure_permitted_parameters

  def new
    @title = 'Create Account'
    super
  end

  def edit
    @title = 'Edit User'
    super
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:terms_and_conditions)
  end
end
