class AddLocationToStops < ActiveRecord::Migration
  def change
    add_column :stops, :latitude, :float
    add_column :stops, :longitude, :float
    add_column :stops, :address, :string
    add_column :stops, :description, :text
    add_column :stops, :title, :string
  end
end
