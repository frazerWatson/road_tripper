require 'rails_helper'

def create_road_trip(title)
  visit '/'
  page.find(".carousel-caption1").click
  fill_in 'Title', with: title
  fill_in 'Description', with: "This is some sample text. you can write whatever you like. really anything you like. such as this!"
  click_button 'Create Road trip'
end