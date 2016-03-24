require 'rails_helper'

feature 'road_trip' do
  context 'no road trips have been added' do
    scenario 'should display a prompt to add a road trip' do
      visit '/'
      expect(page).to have_content 'No road trips yet'
      expect(page).to have_link 'Add a road trip'
    end
  end
end