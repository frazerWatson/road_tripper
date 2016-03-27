require 'rails_helper'

RSpec.describe "itineraries/edit", type: :view do
  before(:each) do
    @itinerary = assign(:itinerary, Itinerary.create!(
      :origin => "MyString",
      :destination => "MyString"
    ))
  end

  it "renders the edit itinerary form" do
    render

    assert_select "form[action=?][method=?]", itinerary_path(@itinerary), "post" do

      assert_select "input#itinerary_origin[name=?]", "itinerary[origin]"

      assert_select "input#itinerary_destination[name=?]", "itinerary[destination]"
    end
  end
end
