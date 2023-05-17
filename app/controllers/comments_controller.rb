class CommentsController < ApplicationController
    before_action :set_commentable, only: [:create]
    def create  
            @comment = @commentable.comments.create(commentable: @commentable, commenter_id: params[:commenter_id],commenter_type: params[:commenter_type], body: params[:comment_body])
        if @commentable == Post.find(params[:commentable_id])
            respond_to do |format|
                format.turbo_stream do
                    render turbo_stream: turbo_stream.replace(
                        "post#{@commentable.id}comments",
                        partial: "posts/post_comments",
                        locals: {post: @commentable}
                        )
                end
            end
        elsif @commentable == Animal.find(params[:commentable_id])
            respond_to do |format|
                format.turbo_stream do
                    render turbo_stream: turbo_stream.replace(
                        "animal#{@commentable.id}comments",
                        partial: "animals/animal_comments",
                        locals: {animal: @commentable}
                        )
                end
            end
        end
    end
    
    def destroy
        @comment = Comment.find(params[:id])
        if(@comment.commenter == current_user || @comment.commenter == current_venue)
            @comment.destroy
    
            respond_to do |format|
                format.turbo_stream do
                render turbo_stream: turbo_stream.remove(
                    "post#{@comment.commentable_id}ModalComment#{@comment.id }"
                    )
                end
            end
        end
    end
    
    
    private
    
    def set_commentable
        if Post
          @commentable = Post.find(params[:commentable_id])
        elsif Animal
          @commentable = Animal.find(params[:commentable_id])
        end  
  end
end
