require 'rails_helper'
require 'capybara/dsl'
require 'selenium-webdriver'

feature 'road_trip' do
before do
    include Capybara::DSL
    Capybara.default_driver = :selenium
end

  scenario 'allows user to add itinerary' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'a@a.com'
    fill_in 'Password', with: '88888888'
    fill_in 'Password confirmation', with: '88888888'
    fill_in 'Username', with: 'DanH'
    fill_in 'Hometown', with: 'London'
    fill_in 'First name', with: 'Dan'
    fill_in 'Last name', with: 'Hash'
    click_button 'Sign up'
    click_link 'New Road trip'
    fill_in 'Title', with: 'New Long Journey to Space'
    click_button 'Create Road trip'
    click_link 'Dashboard'
    click_link 'Add Itinerary'
    fill_in 'Origin', with: 'London'
    fill_in 'Destination', with: 'Fiji/Essex'
    select '2016', from: 'itinerary[start_date(1i)]'
    click_button 'Create Itinerary'
    expect(current_path).to eq "/road_trips/1/edit"
    expect(page).to have_content 'London'
    expect(page).to_not have_link 'Add Itinerary'
  end

end