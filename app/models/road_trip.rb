class RoadTrip < ActiveRecord::Base
	has_many :stops
	belongs_to :user
	has_many :posts
end
