class StopsController < ApplicationController
  before_action :set_stop, only: [:edit, :update, :destroy]

  def index
    @stops = Stop.all.order(:date)
  end

  def new
    @stop = Stop.new
  end

  def edit
  end

  def create
    @stop = Stop.new(stop_params)
      if @stop.save
        redirect_to edit_road_trip_path(@stop.road_trip)
      else
        render :new
      end
  end

  def update
      if @stop.update(stop_params)
        redirect_to edit_road_trip_path(@stop.road_trip)
      else
        render :edit
      end
  end

  def destroy
    stop = @stop.road_trip
    @stop.destroy
    redirect_to edit_road_trip_path(stop)
  end

  private
    def set_stop
      @stop = Stop.find(params[:id])
    end

    def stop_params
      params.require(:stop).permit(:location, :date, :road_trip_id, :latitude, :longitude, :address, :description, :title)
    end
end
