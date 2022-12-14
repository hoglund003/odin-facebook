class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :profile_exists?
  def index
    @posts = Post.all.select{|p| p.user.friends.include?(current_user) || p.user == current_user}
    @posts.concat(Post.all.select{|p| p.user.profile.town == current_user.profile.town})
    @posts.concat(current_user.posts)
    @posts.uniq
    @posts.sort_by{|p| p.created_at}
  end

  def show
    @post = Post.find(params[:id])
  end

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
