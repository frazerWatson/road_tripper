class RoadTrip < ActiveRecord::Base
	has_one :itinerary
	belongs_to :user
	has_many :posts
end
