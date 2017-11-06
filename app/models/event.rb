class Event < ApplicationRecord
  include UpdateUserOweDetail
  has_many :user_event_details
  has_many :users,through: :user_event_details, dependent: :destroy
  validates :name,:date,:amount,:location, presence: true
  validate :check_paid_amount_is_valid



  def check_paid_amount_is_valid
    if !user_event_details.present?
      # validating, select atleast one user for an event
      errors.add(:base, "Please add the friends, who all are have to pay")
    else
      paid_amount = user_event_details.map(&:paid_amount)
      case paid_amount.include?(nil)
      when true
        # checking all the selected users paid amount fields are filled or not
        errors.add(:base, "Please fill all the Paid for an Event fields")
      when false
        # checking paid amount is equal to the event total amount
        errors.add(:base, "you have entered invalid amount, please pay correct event amount") if !paid_amount.reduce(:+).eql?(self.amount)
      end
    end
  end

end
