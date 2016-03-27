require 'rails_helper'
# require 'capybara/dsl'
# require 'selenium-webdriver'

feature 'adding/editing an itinerary for a road trip' do
# before do
#     include Capybara::DSL
#     Capybara.default_driver = :selenium
# end

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

  scenario 'allows user to add one stop to an itinerary' do
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
    fill_in 'Destination', with: 'Berlin'
    select '2016', from: 'itinerary[start_date(1i)]'
    select 'March', from: 'itinerary[start_date(2i)]'
    select '31', from: 'itinerary[start_date(3i)]'
    select '2016', from: 'itinerary[end_date(1i)]'
    select 'April', from: 'itinerary[end_date(2i)]'
    select '29', from: 'itinerary[end_date(3i)]'   
    click_button 'Create Itinerary'
    click_link 'New Stop'
    fill_in 'location', with: 'Calais'
    select '2016', from: 'stop[start_date(1i)]'
    select 'April', from: 'stop[start_date(2i)]'
    select '1', from: 'stop[start_date(3i)]'
    click_button 'Create Stop'
    expect(current_path).to eq "/road_trips/1/edit"
    expect(page).to have_content 'Calais'
  end

end
