require 'rails_helper'

RSpec.describe Itinerary, type: :model do
  it { should have_many :stops }
  it { should belong_to :road_trip }
end