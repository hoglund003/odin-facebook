class ApplicationController < ActionController::Base

  def profile_exists?
    if user_signed_in? && current_user.profile.nil?
      redirect_to profile_new_path
      return
    end
  end

  def no_profile_exists?
    if user_signed_in? && !current_user.profile.nil?
      redirect_to profile_path
      return
    end
  end
end
