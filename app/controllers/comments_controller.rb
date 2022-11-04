class CommentsController < ApplicationController
  before_action :authenticate_user!
  def new
    @comment = Comment.new
  end 

  def create
    @post = Post.find(params[:post_id])
    @comments = Comment.where(post: @post)
    @comment = current_user.comments.new(body: params[:body], post: @post)
    if @comment.save
      redirect_to @post
    else
      flash.now[:alert] = "Comment was not saved"
      render @post
    end
  end
end
