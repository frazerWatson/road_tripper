require 'rails_helper'

RSpec.describe RoadTrip, type: :model do
  
  it { should have_one :itinerary }
  it { should belong_to :user }
  it { should have_many :posts}

  it 'created with a title' do
    road_trip = RoadTrip.new(title: "Going Home")
    expect(road_trip.title).to eq 'Going Home'
  end
end