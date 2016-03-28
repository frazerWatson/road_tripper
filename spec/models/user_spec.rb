require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_one :profile }
  it { should have_many :road_trips }
  it { should have_many :comments }
end