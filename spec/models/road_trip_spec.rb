require 'rails_helper'

RSpec.describe RoadTrip, type: :model do
  it { should have_one :itinerary }
  it { should belong_to :user }
  it { should have_many :posts}
end