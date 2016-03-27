require 'rails_helper'

RSpec.describe "itineraries/index", type: :view do
  before(:each) do
    assign(:itineraries, [
      Itinerary.create!(
        :origin => "Origin",
        :destination => "Destination"
      ),
      Itinerary.create!(
        :origin => "Origin",
        :destination => "Destination"
      )
    ])
  end

  it "renders a list of itineraries" do
    render
    assert_select "tr>td", :text => "Origin".to_s, :count => 2
    assert_select "tr>td", :text => "Destination".to_s, :count => 2
  end
end
