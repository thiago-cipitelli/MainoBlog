class PostsController < ApplicationController
  before_action :require_user_logged_in!, except: [:index, :show]

  def index
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    end
    @posts = Post.all
  end

  def show
    @post = Current.user.posts.find(params[:id])
  end

  def edit
    @post = Current.user.posts.find(params[:id])
  end

  def update
    @post = Current.user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Current.user.posts.create(post_params)
    
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end


  def destroy
    @post = Current.user.posts.find(params[:id])
    @post.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
