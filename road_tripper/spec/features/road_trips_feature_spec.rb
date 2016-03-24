require 'rails_helper'
require 'capybara/dsl'
require 'selenium-webdriver'

feature 'road_trip' do

  before do
     include Capybara::DSL
     Capybara.default_driver = :selenium
  end

  context 'no road trips have been added' do
    scenario 'should display a prompt to add a road trip' do
      visit '/'
      expect(page).to have_content 'No road trips yet'
      expect(page).to have_link 'New Road trip'
    end
  end

  context 'adding a road trip' do
    scenario 'should display a new road trip' do
      visit '/'
      click_link('New Road trip')
      fill_in 'Title', with: 'Long journey'
      click_button('Create Road trip')
      expect(page).to have_content 'Long journey'
      expect(page).to_not have_content 'No road trips yet'
    end
  end

  context 'edit a road trip' do
    before do
      road_trip = RoadTrip.create(title: 'Long journey')
    end
    scenario 'should display the updated road trip details' do
      visit '/'
      click_link('Edit')
      fill_in 'Title', with: 'A short journey'
      click_button('Update Road trip')
      expect(page).to have_content 'A short journey'
      expect(page).to_not have_content 'Long journey'
    end
  end

  context 'delete a road trip' do
    before do
      road_trip = RoadTrip.create(title: 'Long journey')
    end
    scenario 'should display the updated road trip details' do
      visit '/'
      page.accept_confirm do
        click_link ('Destroy')
      end
      expect(page).to_not have_content 'Long journey'
    end
  end
end
