class ProfileController < ApplicationController
  def new
    @profile = Profile.new
  end
end
