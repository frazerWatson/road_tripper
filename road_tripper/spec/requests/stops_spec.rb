require 'rails_helper'

RSpec.describe "Stops", type: :request do
  describe "GET /stops" do
    it "works! (now write some real specs)" do
      get stops_path
      expect(response).to have_http_status(200)
    end
  end
end
