class BiographyController < ApplicationController
  def edit
    @user = find_user(params[:id])

    if turbo_frame_request?
      render partial: "profile/biography", locals: { biography: @biography }
      return
    end
  end

  def update

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
