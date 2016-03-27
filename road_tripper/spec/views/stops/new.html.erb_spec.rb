require 'rails_helper'

RSpec.describe "stops/new", type: :view do
  before(:each) do
    assign(:stop, Stop.new(
      :location => "MyString"
    ))
  end

  it "renders new stop form" do
    render

    assert_select "form[action=?][method=?]", stops_path, "post" do

      assert_select "input#stop_location[name=?]", "stop[location]"
    end
  end
end
