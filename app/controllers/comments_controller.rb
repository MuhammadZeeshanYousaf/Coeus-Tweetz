class CommentsController < ApplicationController

   def create
     @post = Post.find(params[:post_id])
     unless comment_params[:body].empty?
       @comment = @post.comments.new(comment_params)
       @comment.user_id = current_user.id
       @comment.save
     end
     redirect_to post_path(@post)
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
