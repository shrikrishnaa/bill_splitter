# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if (User.all.count <= 0)
    user_amar = User.new(email:"test_1@test.com",first_name: "Amar", last_name: "Mekdara",password: "Password1", password_confirmation: "Password1")
    user_amar.save!
    user_akbar = User.new(email:"test_2@test.com",first_name: "Akbar", last_name: "Mekdara",password: "Password1", password_confirmation: "Password1")
    user_akbar.save!
    user_anthony = User.new(email:"test_3@test.com",first_name: "Anthony", last_name: "Mekdara",password: "Password1", password_confirmation: "Password1")
    user_anthony.save!
    event = Event.new(name: "Dinner", date: "11/11/2017", amount: "100", location: "Bangalore")
    event.user_event_details.build(user_id: user_amar.id,paid_amount: 80)
    event.user_event_details.build(user_id: user_akbar.id,paid_amount: 15)
    event.user_event_details.build(user_id: user_anthony.id,paid_amount: 5)
    event.save!
end
