require 'DBP_API'

class ScripturesController < ApplicationController
  
 # GET /journals
  # GET /journals.json
  def index
    @scriptures = Scripture.all
    @user = current_user
 
  end

  # GET /journals/1
  # GET /journals/1.json
  def show
    @scripture = Scripture.find(params[:id])
    @user = current_user.id
  end

  # GET /journals/new
  def new
    @scripture = Scripture.new
    @user = current_user.id
  end

  # GET /journals/1/edit
  def edit
  end

  # POST /journals
  # POST /journals.json
  def create
    @scripture = Scripture.new(scripture_params)
    @user = current_user.id
    
    #api = UrlApi.new()
    #url = api.get_scripture_url
    
    respond_to do |format|
      if @journal.save
        format.html { redirect_to @scripture, notice: 'Scripture was successfully created.' }
        format.json { render :show, status: :created, location: @scripture }
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
      if @scripture.update(journal_params)
        format.html { redirect_to @scripture, notice: 'Scripture was successfully updated.' }
        format.json { render :show, status: :ok, location: @scripture }
      else
        format.html { render :edit }
        format.json { render json: @scripture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /journals/1
  # DELETE /journals/1.json
  def destroy
    @scripture.destroy
    respond_to do |format|
      format.html { redirect_to scriptures_url, notice: 'Scripture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    

    # Never trust parameters from the scary internet, only allow the white list through.
    def scripture_params
      params.require(:scripture).permit(:passage, :verse)
    end
end

  def create
  	
  end
