class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @posts = Post.order(created_at: :desc).last(6).in_groups_of(3, false)
  end
end
