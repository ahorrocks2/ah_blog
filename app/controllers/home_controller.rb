class HomeController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc).limit(3)
    @tags = Tag.all.order(description: :asc)
  end
end
