class BiographyController < ApplicationController
  def edit
    @user = find_user(params[:id])

    if @user.profile.biography.nil?
      @biography = Biography.new(profile: @user.profile)
    else
      @biography = @user.profile.biography
    end

    if turbo_frame_request?
      render partial: "profile/biography", locals: { biography: @biography }
      return
    end
  end

  def update
    @user = find_user(params[:id])
    unless @user.profile.biography.nil?
      @user.profile.biography.update(body: params[:biography][:body])
    else
      @user.profile.build_biography(body: params[:biography][:body]).save
    end

    if turbo_frame_request?
      render partial: "profile/biography", locals: { biography: @user.profile.biography }
      return
    end
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
