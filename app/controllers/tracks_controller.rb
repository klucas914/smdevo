class TracksController < ApplicationController
  before_action :set_track

  
  def index
    @tracks = Track.all
    @user = current_user
  end

  def show
    @track = Track.find(params[:id])

  end

  def new
    @track = Track.new
    authorize @track
    
  end

  def edit
    @track= Track.find(params[:id])
  end

  def create
    @track = Track.new(track_params)
 
    if @track.save
      redirect_to @track
    else
    	render 'new'
    end
  end

  def update
  	@track = Track.find(params[:id])

  	if @track.update(track_params)
  		redirect_to @track
  	else
  		render 'edit'
  	end
  end
  
  def create_selection
    group_id = selection_params[:group_id]
    track_id = @track.track_id
    selection = Selection.new(group_id: group_id, track_id: track_id)

    if selection.save!
      redirect to group_posts_path(@group)
    else
      redirect to tracks_path
    end
  end

  def destroy
  	@track = Track.find(params[:id])
  	@track.destroy

  	redirect_to tracks_path
  end

  private

  def set_track
    @track = Track.find_by(id: params[:id])
  end
  
  def group_params
    params.require(:group).permit(:title)
  end

  def selection_params
    params.require(:selection).permit(:group_id, :track_id)
  end
  
  def track_params
    params.require(:track).permit(:track_id, :title, :description, :activities_attributes => [:title, :receive, :reflect, :respond])
  end
end
