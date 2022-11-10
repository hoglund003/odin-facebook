class ProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :no_profile_exists?, except: [:edit]

  def edit
    @profile = current_user.profile
    @town = @profile.town.instance_eval{|t| [t.name, t.id]}
    @towns = Town.all.map{|t| [t.name, t.id]}
  end


  def new
    @profile = Profile.new
    @towns = Town.all.map{|t| [t.name, t.id]}
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      Job.create(title: params[:job][:title], company: params[:job][:company], profile: @profile)
      ProfileTown.create(profile: @profile, town_id: params[:profile_town][:town_id])
      flash[:notice] = "Your profile has been created"
      redirect_to profile_path(current_user)
    end
  end

  private

  def profile_params
    p = params.permit(
      :user_id,
      :first_name,
      :last_name
    )
    birthday = Date.new(params["birthday(1i)"].to_i, params["birthday(2i)"].to_i, params["birthday(3i)"].to_i)
    p.merge!(birthday: birthday)
  end
end
