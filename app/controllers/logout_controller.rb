class LogoutController < ApplicationController
    def index
        reset_session
        redirect_to new_session_path
    end
end
