require 'rails_helper'

feature 'Users and profiles' do

  scenario 'displays the sign out link when signed in' do
    user_sign_up("user1@test.com")
    expect(page).to have_button 'Sign out'
    expect(page).to_not have_button 'Sign in'
    expect(page).to_not have_button 'Sign up'
  end

  scenario 'displays the sign up and sign in links when not signed in' do
    visit '/'
    expect(page).to have_button 'Sign up'
    expect(page).to have_button 'Sign in'
  end

  scenario 'signed in user can view own profile' do
    user_sign_up("user1@test.com")
    click_button 'All profiles'
    expect(page).to have_content 'DanH'
    expect(page).to have_selector("img")
  end

  scenario 'signed in user can edit own profile' do
    user_sign_up("user1@test.com")
    click_button 'My profile'
    click_link 'Edit'
    fill_in 'Username', with: 'Bob23'
    click_button 'Update Profile'
    expect(page).to have_content 'Bob23'
    expect(page).to_not have_content 'DanH'
  end

  scenario 'anyone can view all user profiles' do
    user_sign_up("user1@test.com")
    click_button 'Sign out'
    click_button 'All profiles'
    expect(page).to have_content 'DanH'
  end
end