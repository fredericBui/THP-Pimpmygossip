class ApplicationController < ActionController::Base
    def require_login
        if !session[:user_id]
            redirect_to login_path
        end
    end
end
