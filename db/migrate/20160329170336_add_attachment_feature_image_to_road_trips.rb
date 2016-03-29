class AddAttachmentFeatureImageToRoadTrips < ActiveRecord::Migration
  def self.up
    change_table :road_trips do |t|
      t.attachment :feature_image
    end
  end

  def self.down
    remove_attachment :road_trips, :feature_image
  end
end
