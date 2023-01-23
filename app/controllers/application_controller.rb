class ApplicationController < ActionController::Base
    def require_login
        if !session[:user_id]
            redirect_to new_session_path
        end
    end
end
