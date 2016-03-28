class RemoveTitleFromStops < ActiveRecord::Migration
  def change
    remove_column :stops, :title, :string
  end
end
