class Itinerary < ActiveRecord::Base
	belongs_to :road_trip
	has_many :stops
end
