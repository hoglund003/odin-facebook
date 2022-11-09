class ProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :no_profile_exists?
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
  end

  private

  def profile_params
    params.require(:profile).permit(:user_id, :first_name, :last_name, :birthday)
  end
end
