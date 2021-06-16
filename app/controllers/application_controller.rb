class ApplicationController < ActionController::Base
	include RoomsHelper
	before_action :authenticate_user!, except: [:home, :about, :help]
	before_action :configure_permitted_parameters, if: :devise_controller? 
  protect_from_forgery with: :null_session
	private
  
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up,keys:[:name])
	end

	def after_sign_up_path_for(resource)
      microposts_path
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
      microposts_path
  end

	def after_sign_in_path_for(resource)
    microposts_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

end
