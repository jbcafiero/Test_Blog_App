class ArticlesController < ApplicationController
  def home
  end
  def index
    @post = Post.all
  end
  def new
    @post = Post.new
  end
  def show
    @post = Post.find(params[:id])
  end
  def create
  post = Post.new(post_params)
  post.user_id = current_user.id
    if post.save == true
      redirect_to articles_path(post.id)

    else
      redirect_to articles_new_path
    end
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to show_path(params[:id])
  end
  def delete
    @post = Post.find(params[:id])
    @post.delete
    redirect_to articles_path
  end

  private
  def post_params
  params.require(:post).permit(:title, :description)
  end

end
