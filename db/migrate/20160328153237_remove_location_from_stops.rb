class RemoveLocationFromStops < ActiveRecord::Migration
  def change
    remove_column :stops, :location, :string
  end
end
