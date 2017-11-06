class UserEventDetail < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :paid_amount, presence: true

end
