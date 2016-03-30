require 'rails_helper'

feature 'Stops' do

  scenario 'Newly created stops appear on the trip dashboard' do
    visit '/'
    user_sign_up("user1@test.com")
    create_road_trip("An Epic Road Trip!")
    click_link 'Dashboard'
    click_link 'Add new Stop'
    add_stop('Calais')
    expect(page).to have_content 'Calais'
  end

end
