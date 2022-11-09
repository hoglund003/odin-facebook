module UsersHelper
  def profile_exists?
    if user_signed_in? && current_user.profile.nil?
      redirect_to profile_new_path
      return
    end
  end
end
