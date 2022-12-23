class LikeController < ApplicationController
    def like_dislike
        gossip = Gossip.find(params[:id])
        if Like.find_by(liked: gossip)
            puts "find like and destroy"
            Like.find_by(liked: gossip).destroy
            redirect_to gossips_path
        else
            puts "create a like"
            Like.create(user_id: session[:user_id],liked: gossip)
            redirect_to gossips_path
        end
    end

    def like_dislike_comment
        comment = Comment.find(params[:id])
        if Like.find_by(liked: comment)
            puts "find like and destroy"
            Like.find_by(liked: comment).destroy
            redirect_to gossips_path
        else
            puts "create a like"
            Like.create(user_id: session[:user_id],liked: comment)
            redirect_to gossips_path
        end
    end
end
