require 'rails_helper'

def create_road_trip(title)
  visit '/'
  page.find(".carousel-caption1").click
  fill_in 'Title', with: title
  fill_in 'Description', with: "This is the description of this road trip"
  click_button 'Create Road trip'
end