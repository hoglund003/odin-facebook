class ProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :no_profile_exists?, except: [:edit, :update]
  
  def new
    @profile = Profile.new
    @towns = Town.all.map{|t| [t.name, t.id]}
    @profile.job = Job.new
  end
  
  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      @profile.build_job(job_params).save
      @profile.build_profile_town(town_params).save
      flash[:notice] = "Your profile has been created"
      redirect_to profile_path
    end
  end

  def edit
    @profile = current_user.profile
    @town = @profile.town.instance_eval{|t| [t.name, t.id]}
    @towns = Town.all.map{|t| [t.name, t.id]}
  end

  def update
    @profile = Profile.where(profile_params)
    @profile.update(profile_params)
    Job.where(profile: @profile).first.update(job_params)
    ProfileTown.where(profile: @profile).update(town_params)
    redirect_to profile_path
  end

  private

  def profile_params
    p = params.require(:profile).permit(
      :user_id,
      :first_name,
      :last_name
    )
    birthday = Date.new(params[:profile]["birthday(1i)"].to_i, params[:profile]["birthday(2i)"].to_i, params[:profile]["birthday(3i)"].to_i)
    p.merge!(birthday: birthday)
  end

  def job_params
    params.require(:profile).require(:job_attributes).permit(
      :title,
      :company
    )
  end

  def town_params
    params.require(:profile).require(:profile_town).permit(
      :town_id
    )
  end
end
