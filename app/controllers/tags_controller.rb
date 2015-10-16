class TagsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @tag = @post.tags.new
  end

  def create
    @post = Post.find(params[:post_id])
    @tag = @post.tags.new(tag_params)
    if @tag.save
      flash[:notice] = "Tag successfully added!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Oops! Something went wrong!"
      render :new
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to tag_path(@tag)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @tag = Tag.find(params[:id])
    @tag.destroy

    redirect_to post_path(@post)
  end

private
  def tag_params
    params.require(:tag).permit(:description)
  end

end
