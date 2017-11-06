require 'rails_helper'

RSpec.describe UserEventDetail, type: :model do
  context "relationships" do
    it {should belong_to(:user)}
    it {should belong_to(:event)}
  end

  context "validations" do
    it {should validate_presence_of(:paid_amount)}
  end
end
