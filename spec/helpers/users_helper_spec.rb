require 'rails_helper'

def user_sign_up(email)
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: '88888888'
  fill_in 'Password confirmation', with: '88888888'
  fill_in 'Username', with: 'DanH'
  attach_file "Avatar", Rails.root.to_s + "/spec/asset_specs/photos/photo1.jpg"
  fill_in 'Hometown', with: 'London'
  fill_in 'First name', with: 'Dan'
  fill_in 'Last name', with: 'Hash'
  click_button 'Sign up'
end