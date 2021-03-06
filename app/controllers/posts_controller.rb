class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @tags = Tag.all
    @post = Post.new
  end

  def create
    @tags = Tag.all
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post successfully added!"
      redirect_to posts_path
    else
      flash[:alert] = "Oops! Something went wrong!"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:alert] = "Post deleted."
    redirect_to posts_path
  end

private
  def post_params
    params.require(:post).permit(:title, :content, :tag_ids => [])
  end
end
