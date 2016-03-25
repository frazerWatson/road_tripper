class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.string :origin
      t.string :destination
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
