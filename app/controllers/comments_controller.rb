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

  def destroy
    #@post = Post.find(params[:post_id])
    #@comment = @post.comments.find
  end

  private
    def comment_params
      if Current.user.present?
        params.require(:comment).permit(:body).merge(commenter: Current.user.name, user_id: Current.user.id)
      else
        params.require(:comment).permit(:body).merge(commenter: "Anonymous")
      end
    end

    #def check_association
    #  if Current.user.comments.find(params[:id])
    #  
    #end
end
