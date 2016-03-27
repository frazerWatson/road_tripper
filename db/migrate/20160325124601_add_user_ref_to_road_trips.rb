class AddUserRefToRoadTrips < ActiveRecord::Migration
  def change
    add_reference :road_trips, :user, index: true, foreign_key: true
  end
end
