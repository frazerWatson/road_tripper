require "rails_helper"

RSpec.describe RoadTripsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/road_trips").to route_to("road_trips#index")
    end

    it "routes to #new" do
      expect(:get => "/road_trips/new").to route_to("road_trips#new")
    end

    it "routes to #show" do
      expect(:get => "/road_trips/1").to route_to("road_trips#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/road_trips/1/edit").to route_to("road_trips#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/road_trips").to route_to("road_trips#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/road_trips/1").to route_to("road_trips#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/road_trips/1").to route_to("road_trips#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/road_trips/1").to route_to("road_trips#destroy", :id => "1")
    end

  end
end
