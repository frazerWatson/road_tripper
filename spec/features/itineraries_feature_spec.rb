require 'rails_helper'

feature 'Adding/editing an itinerary' do
  before do
    user_sign_up("user1@test.com")
    create_road_trip("An Epic Road Trip!")
    click_link 'Dashboard'
    create_itinerary('London', 'Berlin') 
  end

  scenario 'allows user to add an itinerary' do
    expect(current_path).to eq "/road_trips/1/edit"
    expect(page).to have_content 'Berlin'
    expect(page).to_not have_link 'Add itinerary'
  end

  scenario 'allows user to edit an itinerary' do
    click_link 'Edit itinerary'
    fill_in 'Destination', with: 'Rome'
    click_button 'Update Itinerary'
    expect(page).to_not have_content 'Berlin'
    expect(page).to have_content 'Rome'
  end
end