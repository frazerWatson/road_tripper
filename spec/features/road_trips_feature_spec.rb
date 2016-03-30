require 'rails_helper'

feature 'Road trips' do
  context 'as a signed in user' do
    scenario 'can edit their road trips' do
      user_sign_up('user1@test.com')
      create_road_trip("An Epic Road Trip!")
      click_link('Dashboard')
      click_link('Edit')
      fill_in 'Title', with: 'I Changed My Mind'
      click_button('Update Road trip')
      expect(page).to have_content 'I Changed My Mind'
      expect(page).to_not have_content "An Epic Road Trip!"
    end

    scenario 'can attach a feature image to their road trips' do
      user_sign_up('user1@test.com')
      create_road_trip("An Epic Road Trip!")
      click_link('Dashboard')
      click_link('Edit')
      attach_file "Feature image", Rails.root.to_s + "/spec/asset_specs/photos/photo1.jpg"
      click_button('Update Road trip')
      expect(page).to have_selector("img")
    end

    scenario 'will error if creating road trip without description' do
      user_sign_up('user1@test.com')
      click_link 'Begin your road trip'
      fill_in 'Title', with: "An Epic Road Trip!"
      click_button 'Create Road trip' 
      expect(page).to_not have_content "An Epic Road Trip!"    
    end
  end

  context 'as a non-signed in' do
    before do
      user_sign_up('user1@test.com')
      create_road_trip("An Epic Road Trip!")
      click_link 'Sign out'
    end

    scenario 'cannot create a road trip' do
      click_link('Begin your road trip')
      expect(current_path).to eq '/users/sign_in'
    end

    scenario 'cannot view a road trip\'s dashboard' do
      click_link('View trip')
      expect(page).to_not have_content "Dashboard"
    end
  end
end