class UsersController < ApplicationController
    def new
        if session[:user_id]
            redirect_to gossips_path
        end
    end

    def create
        city = City.find_or_create_by(name: city_param[:city])
        new_user = User.new(user_params.merge(city: city))
        new_user.save ? redirect_to(register_success_path) : redirect_to(root_path)
    end
    
    def success
        
    end

    private

    def city_param
        params.require(:user).permit(:city)
    end

    def user_params
        params.require(:user).permit(:pseudo,:email,:password,:password_confirmation)
    end
end
