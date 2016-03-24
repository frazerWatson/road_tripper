require 'rails_helper'

RSpec.describe "RoadTrips", type: :request do
  describe "GET /road_trips" do
    it "works! (now write some real specs)" do
      get road_trips_path
      expect(response).to have_http_status(200)
    end
  end
end
