class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
      if @post.save
        redirect_to @post.road_trip
      else
        render :new
      end

  end

  def update
      if @post.update(post_params)
        redirect_to @post.road_trip
      else
        render :edit
      end
  end

  def destroy
    road_trip = @post.road_trip
    @post.destroy
    redirect_to road_trip
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :road_trip_id, :image)
  end
end