require 'rails_helper'

RSpec.describe "road_trips/show", type: :view do
  before(:each) do
    @road_trip = assign(:road_trip, RoadTrip.create!(
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
