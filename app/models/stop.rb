class Stop < ActiveRecord::Base
	belongs_to :road_trip

  geocoded_by :address
  after_validation :geocode

end
