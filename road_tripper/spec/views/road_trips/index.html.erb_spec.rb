require 'rails_helper'

RSpec.describe "road_trips/index", type: :view do
  before(:each) do
    assign(:road_trips, [
      RoadTrip.create!(
        :title => "Title"
      ),
      RoadTrip.create!(
        :title => "Title"
      )
    ])
  end

  it "renders a list of road_trips" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
