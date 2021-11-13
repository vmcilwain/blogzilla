class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @posts = Post.order(created_at: :desc).in_groups_of(3, false)
  end

  def show
    @post = Post.find params[:id]
  end
end