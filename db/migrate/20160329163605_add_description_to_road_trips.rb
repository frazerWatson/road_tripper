class AddDescriptionToRoadTrips < ActiveRecord::Migration
  def change
    add_column :road_trips, :description, :text
  end
end
