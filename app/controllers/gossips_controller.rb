class GossipsController < ApplicationController
    def index
        if !session[:user_id]
            redirect_to login_path
        end
    end
end
