# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p 'Database is going to be Populated shortly'

5.times do |n|
  name = Faker::Name.name
  username = "foo#{n + 1}"
  User.create!(name: name,
               username: username)
end

p 'Users Have been created'


10.times do 
  description = Faker::Quote.famous_last_words 
  date = Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today)
  creator_id = Faker::Number.within(range: 1..5)
  location = Faker::Address.street_address
  Event.create!(description: description,
                date: date, 
                creator_id:creator_id,
                location: location)
end
p 'Events Have been Created'

10.times do
  event_id = Faker::Number.within(range: 1..10)
  attendee_id = Faker::Number.within(range: 1..5)
  accept = Faker::Boolean.boolean
  Invitation.create!(attended_event_id: event_id,
                     attendee_id: attendee_id,
                     accepted: accept)
end

p 'Invitations have been created'

p 'ALL TABLES HAVE BEEN GENERATED WITH DATA SUCCESSFULLY'