class Admin::PostsController < Admin::AdminController
  before_action :post, only: %i[show update edit]
  
  def create
    @post = Post.new(post_params)
    
    if @post.save
      redirect_to admin_post_path(@post), success: success_notice(@post)
    else
      flash_error_notice
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to admin_post_path(@post), success: success_notice(@post, :updated)
    else
      flash_error_notice
      render :edit
    end
  end  
  
  def destroy
    redirect_to :index
  end

  def post_params
    params.require(:post).permit(:title).tap do |assign|
      assign[:creator] = current_user if request.post?
      assign[:updater] = current_user if request.put? || request.patch?
    end
  end

  def post
    @post = Post.find params[:id]
  end
  
  
end
