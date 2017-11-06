class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_event_details
  has_many :user_owe_details, dependent: :destroy
  has_many :events,through: :user_event_details, dependent: :destroy
  validates :first_name,:last_name, presence: true
  validates :email, format: {with: /\A([^@\s]+)(\s)*@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, message: "Please enter a valid email address format"}
  validates :password, presence: true, if: :password
  validates_format_of :password, with: /\A(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,50}\Z/,if: :password
end
