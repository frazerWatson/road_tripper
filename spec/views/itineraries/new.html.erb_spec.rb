require 'rails_helper'

RSpec.describe "itineraries/new", type: :view do
  before(:each) do
    assign(:itinerary, Itinerary.new(
      :origin => "MyString",
      :destination => "MyString"
    ))
  end

  it "renders new itinerary form" do
    render

    assert_select "form[action=?][method=?]", itineraries_path, "post" do

      assert_select "input#itinerary_origin[name=?]", "itinerary[origin]"

      assert_select "input#itinerary_destination[name=?]", "itinerary[destination]"
    end
  end
end
