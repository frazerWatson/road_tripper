require 'rails_helper'

RSpec.describe Itinerary, type: :model do
  
  it { should belong_to :road_trip }
end
