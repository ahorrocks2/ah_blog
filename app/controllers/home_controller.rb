class HomeController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
    @tags = Tag.all.order(description: :asc)
  end
end
