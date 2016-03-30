require 'rails_helper'

feature 'Users and profiles' do

  scenario 'displays the sign out link when signed in' do
    user_sign_up("user1@test.com")
    expect(page).to have_link 'Sign out'
    expect(page).to_not have_link 'Sign in'
    expect(page).to_not have_link 'Sign up'
  end

  scenario 'displays the sign up and sign in links when not signed in' do
    visit '/'
    expect(page).to have_link 'Sign up'
    expect(page).to have_link 'Sign in'
  end

  scenario 'signed in user can view own profile' do
    user_sign_up("user1@test.com")
    click_link 'All profiles'
    expect(page).to have_content 'DanH'
    expect(page).to have_selector("img")
  end

  scenario 'anyone can view all user profiles' do
    user_sign_up("user1@test.com")
    click_link 'Sign out'
    click_link 'All profiles'
    expect(page).to have_content 'DanH'
  end
end