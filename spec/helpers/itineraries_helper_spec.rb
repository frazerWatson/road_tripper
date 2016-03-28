require 'rails_helper'

def create_itinerary(origin, destination)
  click_link 'Add itinerary'
  fill_in 'Origin', with: origin
  fill_in 'Destination', with: destination
  select '2016', from: 'itinerary[start_date(1i)]'
  select 'April', from: 'itinerary[start_date(2i)]'
  select '1', from: 'itinerary[start_date(3i)]'
  select '2016', from: 'itinerary[end_date(1i)]'
  select 'May', from: 'itinerary[end_date(2i)]'
  select '10', from: 'itinerary[end_date(3i)]'
  click_button 'Create Itinerary'
end