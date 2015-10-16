class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.create(tag_params)
    if @tag.save
      redirect_to posts_path
    else
      render :new
    end
  end

private
  def tag_params
    params.require(:tag).permit(:description)
  end

end
