require 'rails_helper'

feature 'commenting on our own post' do

  scenario 'allows user to add a comment to their own post' do
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
    click_link 'Add New Post'
    fill_in 'Title', with: "I'm just about to start to take off"
    fill_in 'Body', with: "I need to go to the toilet but I'm strapped in my seat and they are counting down now..."
    click_button 'Create Post'
    click_link 'View Trip Profile'
    expect(page).to have_content "I'm just about to start to take off"
    expect(current_path).to eq "/road_trips/1"
    click_link 'Add Comment'
    fill_in 'Remark', with: 'You got to go, you got to go, right?'
    click_button 'Create Comment'
    expect(current_path).to eq "/road_trips/1/"
    expect(page).to have_content 'You got to go, you got to go, right?'
  end
end