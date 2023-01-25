class CommentsController < ApplicationController
    before_action :require_login
    
    def show
        @comment = Comment.find(params[:id]) 
        @gossip = Gossip.find(params[:gossip_id])
    end

    def new
        @gossip = Gossip.find(params[:gossip_id])
    end

    def create
        gossip = Gossip.find(params[:gossip_id])
        user = User.find(session["user_id"])
        new_comment = Comment.new(comment_params)
        new_comment.gossip = gossip
        new_comment.user = user
        new_comment.save

        redirect_to gossips_path
    end

    def edit
        @comment = Comment.find(params[:id]) 
        @gossip = Gossip.find(params[:gossip_id])
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

    private
    def comment_params
        params.require(:comment).permit(:content)
    end
end
