class GossipsController < ApplicationController
    before_action :require_login
    
    def index
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

    def edit
        @gossip = Gossip.find(params[:id])
    end

    def update
        Gossip.find(params[:id]).update(content: params[:content])
        redirect_to gossips_path
    end

    def delete
        puts params[:id]
        Gossip.find(params[:id]).destroy
        redirect_to gossips_path
    end
end
