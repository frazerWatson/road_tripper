class AddItineraryRefToStops < ActiveRecord::Migration
  def change
    add_reference :stops, :itinerary, index: true, foreign_key: true
  end
end
