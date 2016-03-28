require 'rails_helper'

def add_stop(location)
  fill_in 'Location', with: location
  select '1', from: 'stop[date(3i)]'
  select '2016', from: 'stop[date(1i)]'
  select 'May', from: 'stop[date(2i)]'
  click_button 'Create Stop'
  expect(page).to have_content 'Calais'
end
