require 'rails_helper'

RSpec.describe "road_trips/new", type: :view do
  before(:each) do
    assign(:road_trip, RoadTrip.new(
      :title => "MyString"
    ))
  end

  it "renders new road_trip form" do
    render

    assert_select "form[action=?][method=?]", road_trips_path, "post" do

      assert_select "input#road_trip_title[name=?]", "road_trip[title]"
    end
  end
end
