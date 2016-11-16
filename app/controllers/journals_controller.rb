class JournalsController < ApplicationController
  
  
  # GET /journals
  # GET /journals.json
  def index
    @journals = Journal.all
    @user = current_user
 
  end

  # GET /journals/1
  # GET /journals/1.json
  def show
    @journal = Journal.find(params[:id])
    @tracks = Track.all
    @user = current_user.id
  end

  # GET /journals/new
  def new
    @journal = Journal.new
    @user = current_user.id
  end

  # GET /journals/1/edit
  def edit
  end

  # POST /journals
  # POST /journals.json
  def create
    @journal = Journal.new(journal_params)
    @user = current_user.id

    respond_to do |format|
      if @journal.save
        format.html { redirect_to @journal, notice: 'Journal was successfully created.' }
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
    respond_to do |format|
      if @journal.update(journal_params)
        format.html { redirect_to @journal, notice: 'Journal was successfully updated.' }
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
    @journal.destroy
    respond_to do |format|
      format.html { redirect_to user_journals_url, notice: 'Journal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    

    # Never trust parameters from the scary internet, only allow the white list through.
    def journal_params
      params.require(:journal).permit(user_attributes: [:name])
    end
end
