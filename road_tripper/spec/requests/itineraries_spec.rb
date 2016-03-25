require 'rails_helper'

RSpec.describe "Itineraries", type: :request do
  describe "GET /itineraries" do
    it "works! (now write some real specs)" do
      get itineraries_path
      expect(response).to have_http_status(200)
    end
  end
end
