class Post < ActiveRecord::Base
	belongs_to :road_trip
  has_many :comments
end
