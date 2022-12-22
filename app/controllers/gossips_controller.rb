class GossipsController < ApplicationController
    def index
        if !session[:user_id]
            redirect_to login_path
        end
        @gossips = Gossip.all
    end

    def new

    end

    def create
        if params[:content]
            new_gossip = Gossip.create(content: params[:content], user_id: session[:user_id])
            puts new_gossip
            redirect_to gossips_path
        end
    end

    def view
        @gossip = Gossip.find(params[:id])
    end
end
