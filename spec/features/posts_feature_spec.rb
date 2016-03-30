require 'rails_helper'

feature 'Posting on road trips' do
  before do
    user_sign_up('user1@test.com')
    create_road_trip("An Epic Road Trip!")
    click_link 'Dashboard'
  end

  scenario 'user can add a new post' do
    create_new_post("Just about to set off")
    click_link 'View trip'
    expect(page).to have_content "Just about to set off"
    expect(current_path).to eq "/road_trips/1"
  end

  scenario 'user can attach a photo' do
    click_link 'Add new post'
    fill_in 'Title', with: "Transportation"
    fill_in 'Body', with: "This is my new ride!"
    attach_file "Image", Rails.root.to_s + "/spec/asset_specs/photos/photo1.jpg"
    click_button 'Create Post'
    click_link 'View trip'
    expect(page).to have_selector("img")
  end
end