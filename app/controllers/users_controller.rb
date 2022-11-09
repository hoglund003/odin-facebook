class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :profile_exists?
  def show
    @user = find_user(params[:id])
  end

  def friends
    @user = find_user(params[:user_id])
    @friends = @user.friends
    @friend_requests = @user.friend_requests_in
  end

  private

  def find_user(id)
    # Finds correct user when "/profile" is called
    if id.nil?
      current_user
    else
      User.find(id)
    end
  end
end
