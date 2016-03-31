class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]

  def index
    @profiles = Profile.all
  end

  def show
  end

  def edit
  end

  def update
      if @profile.update(profile_params)
        redirect_to @profile
      else
        render :edit
      end
  end

  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:username, :avatar, :hometown, :first_name, :last_name)
    end
end