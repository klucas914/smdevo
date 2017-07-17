class ActivitiesController < ApplicationController 


  def index
    track = Track.find(params[:track_id])
    @activities = track.activities

    respond_to do |format|
    	format.html
    	format.xml { render :xml => @activities }
    end
  end
  
  def show
  	track = Track.find(params[:track_id])
  	@activity = track.activities.find(params[:id])

  	respond_to do |format|
  		format.html
  		format.xml { render :xml => @activity }
  	end
  end

  def new
  	track = Track.find(params[:track_id])
  	@activity = track.activities.build

  	respond_to do |format|
  		format.html
  		format.xml { render :xml => @activity }
  	end
  end

  def edit
    track = Track.find(params[:track_id])
    @activity = track.activities.find(params[:id])
  end

  def create
  	track = Track.find(params[:track_id])
  	@activity = track.activities.create(activity_params)

  	respond_to do |format|
  		if @activity.save
  			format.html { redirect_to([@activity.track, @activity], :notice => 'Activity was successfully created.') }
        #the key :location is associated to an array in order to build the correct route to the nested resource comment
            format.xml  { render :xml => @activity, :status => :created, :location => [@activity.track, @activity] }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @activity.errors, :status => :unprocessable_entity }
        end
    end
  end
  	
  def update
    track = Track.find(params[:track_id])
  	@activity = track.activities.find(params[:id])

  	respond_to do |format|
  		if @activity.update_attributes(activity_params)
  			format.html { redirect_to([@activity.track, @activity], :notice => 'Activity was successfully updated.') }
        #the key :location is associated to an array in order to build the correct route to the nested resource comment
            format.xml  { head :ok }
        else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @activity.errors, :status => :unprocessable_entity }
        end
    end
  end

  def destroy
    track = Track.find(params[:track_id])
    @activity = track.activities.find(params[:id])
    @activity.destroy
    
    respond_to do |format|
    	format.html { redirect_to(track_activities_url) }
    	format.xml { head :ok }
    end
  end

  def receive
    @activity = Activity.find(params[:id])
    track = Track.find(params[:track_id])

  end

  def reflect
    @activity = Activity.find(params[:id])
    track = Track.find(params[:track_id])
  end

  def respond
    @activity = Activity.find(params[:id])
    track = Track.find(params[:track_id])
    groups = Group.all
  end
end


  private
    def activity_params
    	params.require(:activity).permit(:title, :receive, :reflect, :respond, :tracks_attributes => [:title, :description])
    end
