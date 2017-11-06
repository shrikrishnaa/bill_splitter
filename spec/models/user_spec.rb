require 'rails_helper'

RSpec.describe User, type: :model do

  context "relationships" do
    it {should have_many(:user_owe_details)}
    it {should have_many(:user_event_details)}
    it {should have_many(:events).through(:user_event_details)}
    it {should have_many(:user_owe_details).dependent(:destroy)}
    it {should have_many(:events).through(:user_event_details).dependent(:destroy)}
  end

  context "validations" do
    it {should validate_presence_of(:password)}
    it {should allow_value('Password1').for(:password) }
    it {should allow_value('abc@xyz.net').for(:email) }
    it {should_not allow_value('abc@xyz').for(:email) }
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
    it {should validate_presence_of(:email)}
  end
end
