class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.new(post: @post)
    if @like.save
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = current_user.likes.where(post: @post).first
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end