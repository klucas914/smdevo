class JournalsController < ApplicationController
  
  
  # GET /journals
  # GET /journals.json
  def index
    @user = current_user
    @journals = Journal.all
    #@user = User.find(params[:id])
    #@journals = @user.journals.all
  end

  # GET /journals/1
  # GET /journals/1.json
  def show
    @user = current_user
    @journal = Journal.find(params[:id])
  end

  # GET /journals/new
  def new
    @user = current_user
    @journal = Journal.new
  end

  # GET /journals/1/edit
  def edit
    @user = current_user
    @journal = Journal.find(params[:id])
  end

  # POST /journals
  # POST /journals.json
  def create
    #@user = current_user
    @journal = Journal.new(journal_params)
    @journal.user_id = current_user.id
    

    respond_to do |format|
      if @journal.save
        format.html { redirect_to root_path, notice: 'Journal was successfully created.' }
        format.json { render :show, status: :created, location: @journal }
      else
        format.html { render :new }
        format.json { render json: @journal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /journals/1
  # PATCH/PUT /journals/1.json
  def update
    #raise params.inspect
    @user = current_user
    @journal = Journal.find(params[:id])
    
    respond_to do |format|
      if @journal.update(journal_params)
        format.html { redirect_to root_path, notice: 'Journal was successfully updated.' }
        format.json { render :show, status: :ok, location: @journal }
      else
        format.html { render :edit }
        format.json { render json: @journal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /journals/1
  # DELETE /journals/1.json
  def destroy
    @user = current_user
    @journal = Journal.find(params[:id])
    @journal.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Journal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def user_journals
    @journals = policy_scope(Journal).order(id: :desc)
    #@tracks = Track.all
    @user = current_user
    #@groups = Group.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    

    # Never trust parameters from the scary internet, only allow the white list through.
    def journal_params
      params.require(:journal).permit(:entry, :user_id)
    end
end
