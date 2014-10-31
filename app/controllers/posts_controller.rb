class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_url
    else
      redirect_to :back
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to :back
  end

  def new
    @post = Post.new
    @user = User.find_by(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find_by(params[:user_id])
  end

  private

    def post_params
      params.require(:post).permit(:title, :content, :location)
    end
end
