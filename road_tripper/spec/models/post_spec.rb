require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should belong_to :road_trip }
  it { should have_many :comments }
end
