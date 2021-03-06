require 'rails_helper'

feature 'Stops' do
  before do
    visit '/'
    user_sign_up("user1@test.com")
    create_road_trip("An Epic Road Trip!")
    click_button 'Dashboard'
  end

  scenario 'can create a stop' do
    add_stop('Calais', 'Example description')
    expect(page).to have_content 'Calais'
    expect(current_path).to eq "/road_trips/1/edit"
  end

  scenario 'can create multiple stops with routing' do
    add_stop('Calais', 'Example description')
    add_stop('Dover', 'Example description')
    click_button 'View trip'
    expect(page).to have_content('Calais')
    expect(page).to have_content('Dover')
  end

  scenario 'can delete a stop' do
    add_stop('Calais', 'Example description')
    click_link 'x'
    expect(page).to_not have_content 'Calais'    
    expect(current_path).to eq "/road_trips/1/edit"
  end

  scenario 'can edit a stop' do
    add_stop('Calais', 'Example description')
    click_link 'Edit'
    fill_in 'Address', with: 'Dover'
    click_button 'Update Stop'    
    expect(page).to_not have_content 'Calais'
    expect(page).to have_content 'Dover'   
    expect(current_path).to eq "/road_trips/1/edit"
  end

  scenario 'errors if address is missing' do
    add_stop('', 'Example description')
    expect(page).to have_content "Address can't be blank"
  end

  scenario 'errors if description is missing' do
    add_stop('Dover', '')
    expect(page).to have_content "Description can't be blank"
  end

  scenario 'errors if editing a stop with missing data' do
    add_stop('Calais', 'Example description')
    click_link 'Edit'
    fill_in 'Address', with: ''
    click_button 'Update Stop'    
    expect(page).to have_content "Address can't be blank" 
  end
end
