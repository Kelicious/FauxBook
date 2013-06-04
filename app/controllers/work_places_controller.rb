class WorkPlacesController < ApplicationController
  def new
    @work_place = WorkPlace.new(profile_id: params[:profile_id])
  end

  def create
    @work_place = WorkPlace.new(params[:work_place])
    if @work_place.save
      flash[:success] = "Work place added!"
      redirect_to @work_place.profile.user
    else
      render :new
    end
  end

  def edit
    @work_place = WorkPlace.find(params[:id])
  end

  def update
    @work_place = WorkPlace.find(params[:id])
    if @work_place.update_attributes(params[:work_place])
      flash[:success] = "Work place updated!"
      redirect_to @work_place.profile.user
    else
      render :edit
    end
  end

  def destroy

  end
end
