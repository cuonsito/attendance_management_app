class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery

  def after_sign_in_path_for(resource)
    menu_path
  end

  # deviceのコントローラーのときに、下記のメソッドを呼ぶ
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      # sign_upのときに、usernameも許可する
      devise_parameter_sanitizer.for(:sign_up) << :username
      # account_updateのときに、usernameも許可する
      devise_parameter_sanitizer.for(:account_update) << :username
      # sign_upのときに、emailも許可する
      devise_parameter_sanitizer.for(:sign_up) << :email
      # account_updateのときに、emailも許可する
      devise_parameter_sanitizer.for(:account_update) << :email
    end
end
