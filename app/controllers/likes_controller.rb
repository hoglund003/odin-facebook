class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :profile_exists?
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
