require 'rails_helper'
require 'capybara/dsl'
require 'selenium-webdriver'

feature 'road_trip' do

  before do
    road_trip = RoadTrip.create(title: 'Long journey')
  end

  scenario 'allows user to add itinerary' do
    visit '/'
    click_link 'Show'
    click_link 'Dashboard'
    click_link 'Add Itinerary'
    fill_in 'Origin', with: 'London'
    fill_in 'Destination', with: 'Fiji/Essex'
    select '2016', from: 'itinerary[start_date(1i)]'
    click_button 'Create Itinerary'
    expect(current_path).to eq 'road_trips/1/edit'
    expect(page).to have_content 'London'
    expect(page).to_not have_link 'Add Itinerary'
  end

end