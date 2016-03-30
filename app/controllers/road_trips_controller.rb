class RoadTripsController < ApplicationController
  before_action :set_road_trip, only: [:show, :edit, :update]

  def index
    @road_trips = RoadTrip.all
  end

  def show
    @hash = Gmaps4rails.build_markers(@road_trip.stops) do |stop, marker|
      marker.lat stop.latitude
      marker.lng stop.longitude
    end
  end

  def new
    @road_trip = RoadTrip.new
  end

  def edit
    @hash = Gmaps4rails.build_markers(@road_trip.stops) do |stop, marker|
      marker.lat stop.latitude
      marker.lng stop.longitude
    end
  end

  def create
    @road_trip = RoadTrip.new(road_trip_params)
    @road_trip.user_id = current_user.id
    if @road_trip.save
      redirect_to @road_trip
    else
      render :new
    end
  end

  def update
    if @road_trip.update(road_trip_params)
      redirect_to edit_road_trip_path
    else
      render :edit
    end
  end

  private
  def set_road_trip
    @road_trip = RoadTrip.find(params[:id])
  end

  def road_trip_params
    params.require(:road_trip).permit(:title, :description, :user_id, :feature_image)
  end
end
