class ProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :no_profile_exists?, except: [:edit, :update]
  
  def new
    name = params[:name].split(" ")
    if name.nil?
      @profile = Profile.new
    else
      @profile = Profile.new(first_name: name[0], last_name: name[-1])
    end
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
    unless @profile.town.nil?
      @town = @profile.town.instance_eval{|t| [t.name, t.id]}
    end
    @towns = Town.all.map{|t| [t.name, t.id]}
    unless @profile.job.nil?
      @job = @profile.job
    else
      @job = Job.new(profile: @profile)
    end
  end

  def update
    @profile = Profile.where(profile_params).first
    @profile.update(profile_params)
    unless @profile.job.nil?
      Job.where(profile: @profile).first.update(job_params)
    else
      @profile.build_job(job_params).save
    end

    unless @profile.town.nil?
      ProfileTown.where(profile: @profile).update(town_params)
    else
      @profile.build_profile_town(town_params).save
    end
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
