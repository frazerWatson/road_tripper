require 'rails_helper'

def create_road_trip(title)
  click_link 'Begin your road trip'
  fill_in 'Title', with: title
  fill_in 'Description', with: "This is the description of this road trip"
  click_button 'Create Road trip'
end