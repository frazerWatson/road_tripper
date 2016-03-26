require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should belong_to :road_trip }
end
