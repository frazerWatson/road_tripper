require 'rails_helper'

RSpec.describe "stops/show", type: :view do
  before(:each) do
    @stop = assign(:stop, Stop.create!(
      :location => "Location"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Location/)
  end
end
