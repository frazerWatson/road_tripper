class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        url = "/road_trips/#{@post.road_trip_id}/edit"
        format.html { redirect_to url, notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    url = "/road_trips/#{@post.road_trip_id}"
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to url, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
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