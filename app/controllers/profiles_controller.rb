class ProfilesController < ApplicationController
  def edit
    @profile = Profile.where(user_id: params[:user_id]).first
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(params[:profile])
      flash[:success] = "Profile updated!"
      redirect_to @profile.user
    else
      render :edit
    end
  end
end
