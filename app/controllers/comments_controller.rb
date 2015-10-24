class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def comment_params
    params.require(:comment).permit(:name, :content)
  end
end
