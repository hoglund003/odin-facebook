class FriendRequestsController < ApplicationController
  def create
    friend_request = FriendRequest.new(user: current_user, friend: User.find(params[:user_id]), status: "pending")
    if friend_request.save
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "Could not send request"
      redirect_back(fallback_location: root_path)
    end
  end
end
