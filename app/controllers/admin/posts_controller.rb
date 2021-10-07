class Admin::PostsController < Admin::AdminController
  def destroy
    redirect_to :index
  end
end