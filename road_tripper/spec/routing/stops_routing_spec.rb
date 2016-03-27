require "rails_helper"

RSpec.describe StopsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/stops").to route_to("stops#index")
    end

    it "routes to #new" do
      expect(:get => "/stops/new").to route_to("stops#new")
    end

    it "routes to #show" do
      expect(:get => "/stops/1").to route_to("stops#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/stops/1/edit").to route_to("stops#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/stops").to route_to("stops#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/stops/1").to route_to("stops#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/stops/1").to route_to("stops#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/stops/1").to route_to("stops#destroy", :id => "1")
    end

  end
end
