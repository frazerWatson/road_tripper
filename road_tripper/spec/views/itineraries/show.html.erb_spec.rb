require 'rails_helper'

RSpec.describe "itineraries/show", type: :view do
  before(:each) do
    @itinerary = assign(:itinerary, Itinerary.create!(
      :origin => "Origin",
      :destination => "Destination"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Origin/)
    expect(rendered).to match(/Destination/)
  end
end
