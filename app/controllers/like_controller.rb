class LikeController < ApplicationController
    def like_dislike
        gossip = Gossip.find(params[:id])
        user = User.find(session[:user_id])
        
        if gossip.likes.find_by(user: user)
            like = gossip.likes.find_by(user: user)
            like.destroy
            redirect_to gossips_path
        else
            Like.create(user_id: session[:user_id],liked: gossip)
            redirect_to gossips_path
        end
    end

    def like_dislike_comment
        comment = Comment.find(params[:id])
        user = User.find(session[:user_id])
        
        if comment.likes.find_by(user: user)
            like = comment.likes.find_by(user: user)
            like.destroy
            redirect_to gossips_path
        else
            Like.create(user_id: session[:user_id],liked: comment)
            redirect_to gossips_path
        end
    end
end
