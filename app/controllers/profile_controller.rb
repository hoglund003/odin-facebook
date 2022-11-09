class ProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :no_profile_exists?
  def new
    @profile = Profile.new
  end

  def create
    birthday = Date.new()
    user_id = params[:user_id]
    first_name = params[:first_name]
    last_name = params[:last_name]
    @profile = Profile.new(user_id: user_id, first_name: first_name, last_name: last_name, birthday: birthday)

    if @profile.save
      flash[:notice] = "Your profile has been created"
      redirect_to profile_path(current_user)
    end
  end
end
