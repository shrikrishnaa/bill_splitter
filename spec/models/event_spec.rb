require 'rails_helper'

RSpec.describe Event, type: :model do
  context "relationships" do
    it {should have_many(:user_event_details)}
    it {should have_many(:users).through(:user_event_details)}
    it {should have_many(:users).through(:user_event_details).dependent(:destroy)}
  end

  context "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:date)}
    it {should validate_presence_of(:amount)}
    it {should validate_presence_of(:location)}
  end

end
