require 'rails_helper'

feature 'road_trip' do

  context 'no road trips have been added' do
    scenario 'should display a prompt to add a road trip' do
      visit '/'
      expect(page).to have_content 'No road trips yet'
      expect(page).to have_link 'New Road trip'
    end
  end

  context 'adding a road trip' do
     before do
       RoadTrip.create(title: 'Long journey')
     end
    scenario 'should display a new road trip' do
      visit '/'
      expect(page).to have_content 'Long journey'
      expect(page).to_not have_content 'No road trips yet'
    end
  end

end