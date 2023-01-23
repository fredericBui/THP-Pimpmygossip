class SessionsController < ApplicationController
    def new
        if session[:user_id]
            redirect_to gossips_path
        end
    end

    def create
        puts params[:pseudo]
        puts params[:password]
        user = User.find_by pseudo: params[:pseudo]
        if user
            if user.authenticate(params[:password])
                session[:user_id] = user.id
                puts session[:user_id]
                redirect_to :gossips
            else 
                redirect_to new_session_path, notice: "Wrong password"
            end
        else
            redirect_to new_session_path, notice: "User not found"
        end
    end

    def destroy
        reset_session
        redirect_to new_session_path
    end
end
