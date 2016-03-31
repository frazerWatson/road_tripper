require 'rails_helper'

def create_new_post(title)
  click_button 'Add post'
  fill_in 'Title', with: title
  fill_in 'Body', with: "The car has been serviced, new set of tires. Just need to pack our luggage and we are all set for our epic journey!"
  click_button 'Create Post'
end