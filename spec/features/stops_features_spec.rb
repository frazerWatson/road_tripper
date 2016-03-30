require 'rails_helper'

feature 'Stops' do
  before do
    visit '/'
    user_sign_up("user1@test.com")
    create_road_trip("An Epic Road Trip!")
    click_link 'Dashboard'
  end

  scenario 'can create a stop' do
    click_link 'Add new Stop'
    add_stop('Calais', 'Example description')
    expect(page).to have_content 'Calais'
  end

  scenario 'can delete a stop' do
    click_link 'Add new Stop'
    add_stop('Calais', 'Example description')
    click_link 'x'
    expect(page).to_not have_content 'Calais'    
  end

  scenario 'can edit a stop' do
    click_link 'Add new Stop'
    add_stop('Calais', 'Example description')
    click_link 'Modify'
    fill_in 'Address', with: 'Dover'
    click_button 'Update Stop'    
    expect(page).to_not have_content 'Calais'
    expect(page).to have_content 'Dover'   
  end

  scenario 'errors if address is missing' do
    click_link 'Add new Stop'
    add_stop('', 'Example description')
    expect(page).to have_content "Address can't be blank"
  end

  scenario 'errors if description is missing' do
    click_link 'Add new Stop'
    add_stop('Dover', '')
    expect(page).to have_content "Description can't be blank"
  end

  scenario 'errors if editing a stop with missing data' do
    click_link 'Add new Stop'
    add_stop('Calais', 'Example description')
    click_link 'Modify'
    fill_in 'Address', with: ''
    click_button 'Update Stop'    
    expect(page).to have_content "Address can't be blank" 
  end

end
