require "rails_helper"

RSpec.describe ItinerariesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/itineraries").to route_to("itineraries#index")
    end

    it "routes to #new" do
      expect(:get => "/itineraries/new").to route_to("itineraries#new")
    end

    it "routes to #show" do
      expect(:get => "/itineraries/1").to route_to("itineraries#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/itineraries/1/edit").to route_to("itineraries#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/itineraries").to route_to("itineraries#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/itineraries/1").to route_to("itineraries#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/itineraries/1").to route_to("itineraries#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/itineraries/1").to route_to("itineraries#destroy", :id => "1")
    end

  end
end
