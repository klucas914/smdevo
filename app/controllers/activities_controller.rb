class ActivitiesController < ApplicationController

  //def edit
    @activity = @activity.find(params[:id])
    render 'activities/form'
  end

  def create
  	@track = Track.find(params[:track_id])
  	@activity = @track.activities.create(activity_params)
  	redirect_to track_path(@track)
  end

  //def update
    @track = Track.find(params[:track_id])
    @activity = @track.activities.find(params[:id])
    @activity.update
    redirect_to track_path(@track)
  end

  def destroy
    @track = Track.find(params[:track_id])
    @activity = @track.activities.find(params[:id])
    @activity.destroy
    redirect_to track_path(@track)
  end


  private
    def activity_params
    	params.require(:activity).permit(:title, :receive, :reflect, :respond)
    end
end
