require 'rails_helper'

RSpec.describe UserOweDetail, type: :model do
  context "relationships" do
    it {should belong_to(:user)}
    it {should belong_to(:owe_user).class_name('User').with_foreign_key('owe_user_id')}
  end
end
