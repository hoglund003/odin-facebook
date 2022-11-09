class FriendRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :profile_exists?
  def create
    friend_request = FriendRequest.new(user: current_user, friend: User.find(params[:user_id]), status: "pending")
    if friend_request.save
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "Could not send request"
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    friend_request = FriendRequest.find(params[:id])
    friend_request.delete
    Friendship.create(user: friend_request.user, friend: friend_request.friend)
    Friendship.create(user: friend_request.friend, friend: friend_request.user)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    friend_request = FriendRequest.find(params[:id])
    friend_request.delete
    redirect_back(fallback_location: root_path)
  end
end
