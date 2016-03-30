class StopsController < ApplicationController
  before_action :set_stop, only: [:show, :edit, :update, :destroy]

  # GET /stops
  # GET /stops.json
  def index
    @stops = Stop.all.order(:date)
  end

  # GET /stops/1
  # GET /stops/1.json
  def show
  end

  # GET /stops/new
  def new
    @stop = Stop.new
  end

  # GET /stops/1/edit
  def edit
  end

  # POST /stops
  # POST /stops.json
  def create
    @stop = Stop.new(stop_params)

    respond_to do |format|
      if @stop.save
        dashboard_url = "/road_trips/#{@stop.road_trip_id}/edit"
        format.html { redirect_to dashboard_url, notice: 'Stop was successfully created.' }
        format.json { render :show, status: :created, location: @stop }
      else
        format.html { render :new }
        format.json { render json: @stop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stops/1
  # PATCH/PUT /stops/1.json
  def update
    respond_to do |format|
      if @stop.update(stop_params)
        dashboard_url = "/road_trips/#{@stop.road_trip_id}/edit"
        format.html { redirect_to dashboard_url, notice: 'Stop was successfully updated.' }
        format.json { render :show, status: :ok, location: @stop }
      else
        format.html { render :edit }
        format.json { render json: @stop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stops/1
  # DELETE /stops/1.json
  def destroy
    dashboard_url = "/road_trips/#{@stop.road_trip_id}/edit"
    @stop.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_url, notice: 'Stop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stop
      @stop = Stop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stop_params
      params.require(:stop).permit(:location, :date, :road_trip_id, :latitude, :longitude, :address, :description, :title)
    end
end
