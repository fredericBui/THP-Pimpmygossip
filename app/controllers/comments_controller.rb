class CommentsController < ApplicationController
    before_action :require_login
    
    def show
        @comment = Comment.find(params[:id]) 
        @gossip = Gossip.find(params[:gossip_id])
    end

    def new
    end

    def create
        new_comment = Comment.create(content: params[:content], gossip_id: params[:id], user_id: session["user_id"])
        puts new_comment
        redirect_to gossips_path
    end

    def edit
        @comment = Comment.find(params[:id]) 
    end

    def update
        comment = Comment.find(params[:id])
        comment.update(content: params[:content])
        redirect_to gossips_path
    end

    def destroy
        Comment.find(params[:id]).destroy
        redirect_to gossips_path
    end
end
