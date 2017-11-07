# README

This is the bill splitter application. This application can have more than three users. This application having user signup.
After signup, using that credentials, the user can log in and can add the events
with participants.
This application maintains each person how much paid for an event and it maintains the owe details.
This application calculates and updates the previous owe details with the current event spent amount.
And this application maintains the overall details each person how much has to pay others.
This application developed as a CRUD.

* Ruby version
      - ruby 2.3.1p112
* Rails version
      - 5.1.4
* System dependencies
      - mysql Server version: 5.7.19-

* Configuration
      - username: root
      - password: root

* Database creation
   - rails db:create

* Database initialization
   - rails db:migrate
   - rails db:seed

* How to run the test suite
   - bundle exec rspec spec

* After runnning the seed data you can login using the below credentials
    - Email: test_1@test.com
    - Password: Password1

    otherwise you can signup your own.
