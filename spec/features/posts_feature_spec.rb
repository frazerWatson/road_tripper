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

  scenario 'user can delete a post' do
    create_new_post("Just about to set off")
    click_link 'View trip'
    click_link 'x'
    expect(page).to_not have_content "Just about to set off"    
  end

  scenario 'user can modify a post' do
    create_new_post("Just about to set off")
    click_link 'View trip'
    click_link 'Edit'
    fill_in 'Title', with: "I'm not going now"
    click_button 'Update Post'   
    expect(page).to have_content "I'm not going now"
  end

  scenario 'errors if creating a post without a title' do
    create_new_post("")
    expect(page).to have_content "Title can't be blank"
  end

  scenario 'errors if creating a post without a body' do
    click_link 'Add new post'
    fill_in 'Title', with: title
    click_button 'Create Post'
    expect(page).to have_content "Body can't be blank"
  end

  scenario 'errors if updating a post without a title' do
    create_new_post("Just about to set off")
    click_link 'View trip'
    click_link 'Edit'
    fill_in 'Title', with: ""
    click_button 'Update Post'   
    expect(page).to have_content "Title can't be blank"
  end
end