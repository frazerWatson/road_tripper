require 'rails_helper'

def add_stop(location, description)
  fill_in 'Address', with: location
  fill_in 'Description', with: description
  select '2016', from: 'stop[date(1i)]'
  select 'May', from: 'stop[date(2i)]'
  select '1', from: 'stop[date(3i)]'
  click_button 'Create Stop'
end
