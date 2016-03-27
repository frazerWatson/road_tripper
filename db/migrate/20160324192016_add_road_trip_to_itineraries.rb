class AddRoadTripToItineraries < ActiveRecord::Migration
  def change
    add_reference :itineraries, :road_trip, index: true, foreign_key: true
  end
end
