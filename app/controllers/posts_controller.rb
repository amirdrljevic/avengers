class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :check_for_comments, only: [:destroy]

  def index
    if params[:my_posts]&.present? && params[:my_posts] == "true" 
      @posts = current_user.posts.includes(:comments).paginate(page: params[:page], per_page: 2)
    else
      @posts = Post.includes(:comments).paginate(page: params[:page], per_page: 2)
    end
  end

  def show
    @post = Post.find(params[:id])
    @posts = Post.limit(7).order('id desc') #to populate the sidebar
    @comment = @post.comments.build
    @comment.user = current_user
    @comments = @post.comments.paginate(page: params[:page], per_page: 3)
  end

  def new
    @post = current_user.posts.build
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
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
        format.html { redirect_to @post, notice: "Post was successfully updated." }
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
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :description)
    end

    def check_for_comments
      if @post.comments.any?
        respond_to do |format|
          format.html { redirect_to @post, notice: "You cannot delete post with comments. Delete comments first." }
          format.json { head :no_content }
        end
      end
    end
end
