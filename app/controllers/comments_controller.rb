class CommentsController < ApplicationController
    before_action :set_comment_parent
    def create 
        if User
        @comment = @parent.comments.create(user: current_user, body: params[:comment_body])
        elsif Venue
            @comment = @parent.comments.create(venue: current_venue, body: params[:comment_body])
        end
    end
    
    def destroy
        @comment = Comment.find(params[:id])
        if(@comment.user == current_user || @comment.venue == current_venue)
            @comment.destroy
        end
        
    end
    
            
    def set_comment_parent
        if params[:post_id].pesent?
            @parent = Post.find(params[:post_id])
        elsif params[:animal_id].pesent?
            @parent = Animal.find(params[:animal_id])
        end
    end
end