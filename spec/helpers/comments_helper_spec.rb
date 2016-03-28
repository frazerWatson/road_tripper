require 'rails_helper'

def add_comment(remark)
  click_link 'Add comment'
  fill_in 'Remark', with: remark
  click_button 'Create Comment'
end