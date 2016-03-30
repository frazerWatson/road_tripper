require 'rails_helper'

feature 'Users can comment' do
  before do
    user_sign_up('user1@test.com')
    create_road_trip("An Epic Road Trip!")
    click_link 'Dashboard'
    create_new_post("Just about to set off")
    click_link 'View trip'
  end

  scenario 'on their own posts' do
    add_comment("Best of luck to myself!")
    expect(current_path).to eq "/road_trips/1/"
    expect(page).to have_content "Best of luck to myself!"
  end

  scenario 'on other users\' posts' do
    click_link 'Sign out'
    user_sign_up('user2@test.com')   
    click_link 'View trip'
    add_comment("Have fun Dan!")
    expect(page).to have_content "Have fun Dan!"
  end

  scenario 'shows an error message when remark is blank' do
    add_comment("")
    expect(page).to have_content "Remark can't be blank"
  end

end