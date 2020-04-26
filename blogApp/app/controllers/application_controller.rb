class ApplicationController < ActionController::Base
    before_action :authenticate_user, :only => [:home, :profile, :setting]
    before_action :save_login_state, :only => [:login, :login_attempt]
   
end
