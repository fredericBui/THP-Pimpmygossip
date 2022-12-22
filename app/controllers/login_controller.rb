class LoginController < ApplicationController
    def index

    end

    def connect
        puts params[:pseudo]
        puts params[:password]
        user = User.find_by pseudo: params[:pseudo]
        if user
            if user.authenticate(params[:password])
                session[:user_id] = user.id
                puts session[:user_id]
                redirect_to :gossips
            else 
                redirect_to :login, notice: "Wrong password"
            end
        else
            redirect_to :login, notice: "User not found"
        end
    end
end
