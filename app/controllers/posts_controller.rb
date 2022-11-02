class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post_params, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.includes(:user).all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:notice] = "Disaster Information was created successfully."
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    @post.update(post_params)
    @post.user = current_user
    if @post.save
      flash[:notice] = "Disaster Information was update successfully."
      redirect_to posts_path
    end
  end
  private

  def post_params
    params.require(:post).permit(:title, :content, :address)
  end

  def set_post_params
    @post = Post.find(params[:id])
  end
end