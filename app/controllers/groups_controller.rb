class GroupsController < ApplicationController
  
  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])
    @track_options = Track
      .where('id NOT IN (SELECT s.track_id FROM selections s WHERE s.group_id = ?)', @group.id)
    #@track = Track.all
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # POST /groups/:id/add_track
  def add_track
    @group = Group.find(params[:id])

    if Selection.create(group_id: params[:id], track_id: params[:track_id])
      redirect_to group_path(@group)
    else
      render { :show }
    end
  end

  def delete_track
    group = Group.find(params[:id])
    track_id = Track.find(params[:track_id])

    #track = track.find(params[:track_id]) 
    @selection = Selection.find(:group_id, :track_id)

    @selection.destroy
    
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def create_role
    # Find the user by email
    email = role_params[:user][:email]
    
    #name = role_params[:name]
    user = User.find_by_email(email)
    

    # If they don't exist, invite them
    #unless user
      # NOTE: we give them a fake password for now. Eventually we'll use the
      # Devise invitable gem
     # user = User.create!(name: name, email: 'john@email.com')
    #end

    # Add a role for the user, the current group, and their role type
    @group = Group.find(params[:id])
    role_type = role_params[:role_type]
    role = Role.new(user: user, group: @group, role_type: role_type)

    respond_to do |format|
      if role.save!
        format.html { redirect_to @group, notice: 'User was successfully added to group.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :show, notice: 'There was an error adding the user to the group.' }
        format.json { render json: role.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def delete_role
  end
  
  

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group = Group.find(params[:id])
    
    @group.destroy
    
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:title, :group_id)
    end

    def role_params
      params.require(:role).permit(:role_type, :user => [:name, :email])
    end
end
