require 'rails_helper'

feature 'Road trips' do
  before do
    user_sign_up('user1@test.com')
    create_road_trip("An Epic Road Trip!")
  end

  context 'as a signed in user' do
    scenario 'can edit their road trips' do
      click_link('Dashboard')
      click_link('Edit')
      fill_in 'Title', with: 'I Changed My Mind'
      click_button('Update Road trip')
      expect(page).to have_content 'I Changed My Mind'
      expect(page).to_not have_content "An Epic Road Trip!"
    end

    scenario 'errors if updating with missing title' do
      click_link('Dashboard')
      click_link('Edit')
      fill_in 'Title', with: ''
      click_button('Update Road trip')
      expect(page).to have_content "Title can't be blank"
    end

    scenario 'errors if updating with missing description' do
      click_link('Dashboard')
      click_link('Edit')
      fill_in 'Description', with: ''
      click_button('Update Road trip')
      expect(page).to have_content "Description can't be blank"
    end
  end

  context 'as a non-signed in' do
    before do
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

    scenario 'cannot delete any road trip' do
      click_link('View trip')
      expect(page).to_not have_content "Delete road trip"
    end
  end
end