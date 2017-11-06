FactoryGirl.define do
  factory :user, class: :user do
    first_name 'first_user'
    email 'admin@test.com'
    last_name 'last_name'
    password 'Password1'
    password_confirmation 'Password1'
  end
end
