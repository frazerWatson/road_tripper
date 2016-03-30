class StopsController < ApplicationController
  before_action :set_stop, only: [:edit, :update, :destroy]

  def new
    @stop = Stop.new
  end

  def edit
  end

  def create
    @stop = Stop.new(stop_params)

    respond_to do |format|
      if @stop.save
        dashboard_url = "/road_trips/#{@stop.road_trip_id}/edit"
        format.html { redirect_to dashboard_url, notice: 'Stop was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @stop.update(stop_params)
        dashboard_url = "/road_trips/#{@stop.road_trip_id}/edit"
        format.html { redirect_to dashboard_url, notice: 'Stop was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    dashboard_url = "/road_trips/#{@stop.road_trip_id}/edit"
    @stop.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_url, notice: 'Stop was successfully destroyed.' }
    end
  end

  private
    def set_stop
      @stop = Stop.find(params[:id])
    end

    def stop_params
      params.require(:stop).permit(:location, :date, :road_trip_id, :latitude, :longitude, :address, :description, :title)
    end
end
