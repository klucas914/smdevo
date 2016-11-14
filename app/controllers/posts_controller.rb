class PostsController < ApplicationController
  before_action :authenticate_user!
  # GET /posts
  # GET /posts.json
  def index
    @group = Group.find(params[:group_id])
    @posts = @group.posts.order(id: :desc)
    @tracks = Track.all  
    @user = current_user
  
    respond_to do |format|
      format.html
      format.xml { render :xml => @posts}
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    group = Group.find(params[:group_id])
    @post = group.posts

    respond_to do |format|
      format.html
      format.xml { render :xml => @post }
    end
  end

  # GET /posts/new
  def new
    @group = Group.find(params[:group_id])
    @post = @group.posts.build
    @user = current_user

    respond_to do |format|
      format.html
      format.xml { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @groups = Group.all
    @user = current_user
  end

  # POST /posts
  # POST /posts.json
  def create
    @group = Group.find(params[:group_id])
    @post = current_user.posts.build(post_params)
    @post.user_id = current_user.id
    @groups = Group.all

    respond_to do |format|
      if @post.save
        format.html { redirect_to group_posts_path(@group), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    group = Group.find(params[:group_id])
    @post = group.posts.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to group_posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def user_posts
    @posts = policy_scope(Post).order(id: :desc)
    @tracks = Track.all
    @user = current_user
    @groups = Group.all
    
  end


  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:published, :content, :user_id, :group_id, user_attributes: [:name], group_attributes: [:title])
    end

  end