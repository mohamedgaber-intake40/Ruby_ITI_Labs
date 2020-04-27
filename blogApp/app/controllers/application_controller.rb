class ApplicationController < ActionController::Base
    # before_action :authenticate_user!, :only => [:home, :profile, :setting]
    # before_action :save_login_state, :only => [:login, :login_attempt]
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
  
    def configure_permitted_parameters
      added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end

    rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { head :forbidden, content_type: 'text/html' }
        format.html { redirect_to articles_path, alert: exception.message }
        format.js   { head :forbidden, content_type: 'text/html' }
      end
    end
   
end
