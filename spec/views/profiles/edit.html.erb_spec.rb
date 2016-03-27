require 'rails_helper'

RSpec.describe "profiles/edit", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :username => "MyString",
      :hometown => "MyString",
      :first_name => "MyString",
      :last_name => "MyString"
    ))
  end

  it "renders the edit profile form" do
    render

    assert_select "form[action=?][method=?]", profile_path(@profile), "post" do

      assert_select "input#profile_username[name=?]", "profile[username]"

      assert_select "input#profile_hometown[name=?]", "profile[hometown]"

      assert_select "input#profile_first_name[name=?]", "profile[first_name]"

      assert_select "input#profile_last_name[name=?]", "profile[last_name]"
    end
  end
end
