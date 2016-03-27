class CreateRoadTrips < ActiveRecord::Migration
  def change
    create_table :road_trips do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
