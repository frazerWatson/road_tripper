require 'rails_helper'

RSpec.describe "stops/index", type: :view do
  before(:each) do
    assign(:stops, [
      Stop.create!(
        :location => "Location"
      ),
      Stop.create!(
        :location => "Location"
      )
    ])
  end

  it "renders a list of stops" do
    render
    assert_select "tr>td", :text => "Location".to_s, :count => 2
  end
end
