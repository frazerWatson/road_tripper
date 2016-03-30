class Stop < ActiveRecord::Base
	belongs_to :road_trip

  geocoded_by :address
  after_validation :geocode

  validates :address, presence: true
  validates :description, presence: true
  validates :date, presence: true
end
