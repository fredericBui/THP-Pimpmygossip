class RegisterController < ApplicationController
    def index
        if session[:user_id]
            redirect_to gossips_path
        end
    end

    def create_user
        pseudo = params[:pseudo]
        email = params[:email]
        password = params[:password]
        password_confirmation = params[:password_confirmation]
        if City.find_by name: params[:city]
            city = City.find_by name: params[:city]
        else
            city = City.create(name: params[:city])
        end
        
        new_user = User.create(pseudo: pseudo,email: email, city: city , password: password, password_confirmation: password_confirmation)
        
        if new_user.id
            puts new_user
            redirect_to register_success_path
        end
    end
    
    def success
        
    end
end
