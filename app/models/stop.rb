class Stop < ActiveRecord::Base
	belongs_to :itinerary

  geocoded_by :address
  after_validation :geocode

end
