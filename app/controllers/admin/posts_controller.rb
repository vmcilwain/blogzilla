class Admin::PostsController < Admin::AdminController
  before_action :post, only: %i[show update edit destroy]
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to admin_post_path(@post), success: success_message(@post)
    else
      error_message
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to admin_post_path(@post), success: success_message(@post, :updated)
    else
      error_message
      render :edit
    end
  end  
  
  def destroy
    @post.destroy
    redirect_to admin_posts_path, success: success_message(@post, :deleted)
  end

  def post_params
    params.require(:post).permit(:title, :content).tap do |assign|
      assign[:creator] = current_user if request.post?
      assign[:updater] = current_user if request.put? || request.patch?
    end
  end

  def post
    @post = Post.find params[:id]
  end
end
