class AddRoadTripRefToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :road_trip, index: true, foreign_key: true
  end
end
