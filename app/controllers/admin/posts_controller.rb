class Admin::PostsController < Admin::AdminController
  def create
    redirect_to :index
  end

  def update
    redirect_to :index
  end  
  
  def destroy
    redirect_to :index
  end
end
