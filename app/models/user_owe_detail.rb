class UserOweDetail < ApplicationRecord
  belongs_to :user
  belongs_to :owe_user, :class_name => "User", :foreign_key => "owe_user_id"
end
