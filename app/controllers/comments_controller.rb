class CommentsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[create destroy]
  before_action :post

  def create
    @comment = Comment.new(comment_params)
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, success: success_message(@comment) }
        format.js
      else
        format.html do
          error_message
          redirect_to @post
        end
        format.js
      end
    end
  end
  
  private

  def post
    @post = Post.find params[:post_id]
  end

  def comment_params
    params.require(:comment).permit(:post_id, :name, :email, :content).tap do |assign|
      assign[:post] = @post
      assign[:creator] = current_user if request.post?
      assign[:updater] = current_user if request.put? || request.patch?
    end
  end
  
end
