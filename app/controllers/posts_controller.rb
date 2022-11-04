class PostsController < ApplicationController
  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = "Post was created"
      redirect_to "/profile"
    else
      flash.now[:alert] = "Post was not saved"
      render "new"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end