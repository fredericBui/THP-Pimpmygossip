class GossipsController < ApplicationController
    before_action :require_login

    def index
        @gossips = Gossip.all
    end

    def new

    end

    def create
        user = User.find(session[:user_id])
        gossip = Gossip.new(gossip_params)
        gossip.user = user
        gossip.save
        redirect_to gossips_path
    end

    def show
        @gossip = Gossip.find(params[:id])
    end

    def edit
        @gossip = Gossip.find(params[:id])
    end

    def update
        gossip = Gossip.find(params[:id])
        gossip.update(gossip_params)
        redirect_to gossips_path
    end

    def destroy
        Gossip.find(params[:id]).destroy
        redirect_to gossips_path
    end

    private
    def gossip_params
        params.require(:gossip).permit(:content)
    end
end
