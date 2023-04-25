class CommentsController < ApplicationController

  def edit
    
  end

  def update
    
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
    
  end

  private
    def comment_params
      if Current.user.present?
        params.require(:comment).permit(:body).merge(commenter: Current.user.name)
      else
        params.require(:comment).permit(:body).merge(commenter: "Anonymous")
      end
    end
end
