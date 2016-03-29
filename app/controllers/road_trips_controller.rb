class RoadTripsController < ApplicationController
  before_action :set_road_trip, only: [:show, :edit, :update, :destroy]

  # GET /road_trips
  # GET /road_trips.json
  def index
    @road_trips = RoadTrip.all
  end

  # GET /road_trips/1
  # GET /road_trips/1.json
  def show
    @current_location = request.location.city
    @road_trip_stops = @road_trip.stops
    @hash = Gmaps4rails.build_markers(@road_trip_stops) do |stop, marker|
      marker.lat stop.latitude
      marker.lng stop.longitude
    end
  end

  # GET /road_trips/new
  def new
    @road_trip = RoadTrip.new
  end

  # GET /road_trips/1/edit
  def edit
      @current_location = request.location.city
      @road_trip_stops = @road_trip.stops
      @hash = Gmaps4rails.build_markers(@road_trip_stops) do |stop, marker|
        marker.lat stop.latitude
        marker.lng stop.longitude
    end
  end

  # POST /road_trips
  # POST /road_trips.json
  def create
    @road_trip = RoadTrip.new(road_trip_params)
    @road_trip.user_id = current_user.id
    respond_to do |format|
      if @road_trip.save
        format.html { redirect_to @road_trip, notice: 'Road trip was successfully created.' }
        format.json { render :show, status: :created, location: @road_trip }
      else
        format.html { render :new }
        format.json { render json: @road_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /road_trips/1
  # PATCH/PUT /road_trips/1.json
  def update
    respond_to do |format|
      dashboard_url = "/road_trips/#{@road_trip.id}/edit"
      if @road_trip.update(road_trip_params)
        format.html { redirect_to dashboard_url, notice: 'Road trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @road_trip }
      else
        format.html { render :edit }
        format.json { render json: @road_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /road_trips/1
  # DELETE /road_trips/1.json
  def destroy
    @road_trip.destroy
    respond_to do |format|
      format.html { redirect_to road_trips_url, notice: 'Road trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_road_trip
      @road_trip = RoadTrip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def road_trip_params
      params.require(:road_trip).permit(:title, :description, :user_id)
    end
  end
