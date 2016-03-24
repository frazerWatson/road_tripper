require 'rails_helper'

feature 'signing up' do

  scenario 'allows user to sign up' do
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
    expect(current_path).to eq '/'
    expect(page).to have_link 'Sign out'
    expect(page).to_not have_link 'Sign in'
  end

  scenario 'allows user to sign up and view profile' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'test@a.com'
    fill_in 'Password', with: '88888888'
    fill_in 'Password confirmation', with: '88888888'
    fill_in 'Username', with: 'DanH'
    fill_in 'Hometown', with: 'London'
    fill_in 'First name', with: 'Dan'
    fill_in 'Last name', with: 'Hash'
    click_button 'Sign up'
    visit '/profiles/:id/'
    expect(page).to have_content 'DanH'
  end


end