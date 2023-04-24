class PostController < ApplicationController
  def index
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    end
    @posts = Post.all
  end
end
