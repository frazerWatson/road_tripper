require 'rails_helper'

RSpec.describe "stops/edit", type: :view do
  before(:each) do
    @stop = assign(:stop, Stop.create!(
      :location => "MyString"
    ))
  end

  it "renders the edit stop form" do
    render

    assert_select "form[action=?][method=?]", stop_path(@stop), "post" do

      assert_select "input#stop_location[name=?]", "stop[location]"
    end
  end
end
