class AddRoadTripRefToStops < ActiveRecord::Migration
  def change
    add_reference :stops, :road_trip, index: true, foreign_key: true
  end
end
