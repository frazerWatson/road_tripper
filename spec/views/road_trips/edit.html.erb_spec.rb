require 'rails_helper'

RSpec.describe "road_trips/edit", type: :view do
  before(:each) do
    @road_trip = assign(:road_trip, RoadTrip.create!(
      :title => "MyString"
    ))
  end

  it "renders the edit road_trip form" do
    render

    assert_select "form[action=?][method=?]", road_trip_path(@road_trip), "post" do

      assert_select "input#road_trip_title[name=?]", "road_trip[title]"
    end
  end
end
