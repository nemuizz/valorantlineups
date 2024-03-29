class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :set_q, only: [:index, :search]
  before_action :set_map_and_agent, only: [:new, :edit, :search, :index, :update, :create]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  # GET /posts or /posts.json
  def index
    @posts = Post.with_attached_hit.with_attached_position.with_attached_angle.includes(:favorite, :map, :agent).page(params[:page]).per(15)
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    
  end

  # GET /posts/1/edit
  def edit
    
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    
    

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to user_path(current_user.id), notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search  
     
    @posts = @q.result(distinct: true).order(favorites_count: "desc").with_attached_hit.with_attached_position.with_attached_angle.includes(:favorites, :map, :agent).page(params[:page]).per(15)
    
  end

 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.fetch(:post, {})
      params.require(:post).permit(:title, :map_id, :agent_id, :content, :position, :angle, :hit )
      
    end

    def set_q
      @q = Post.ransack(params[:q])
    end

    def set_map_and_agent
      @maps = Map.all
      @agents = Agent.all
    end

    def ensure_correct_user
      if @post.user_id != current_user.id
        flash[:notice] = "You are not authorized to access."
        redirect_to "/"
      end
    end

end
