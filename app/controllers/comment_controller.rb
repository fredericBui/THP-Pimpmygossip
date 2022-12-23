class CommentController < ApplicationController
    def index
        @comment = Comment.find(params[:id]) 
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

    def delete
        Comment.find(params[:id]).destroy
        redirect_to gossips_path
    end
end
