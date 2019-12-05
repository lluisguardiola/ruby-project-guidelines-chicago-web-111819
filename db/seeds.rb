require 'faker'

number_of_artists = 30
number_of_concerts = 60
number_of_attendees = 2000
number_of_venues = 10
number_of_attendees_concerts = (500..5000).to_a.sample
#number_of_attendances = 0 #EDIT THIS LATER

number_of_artists.times do 
    Artist.create(
        name: Faker::Music.band,
        genre: Faker::Music.genre
    )
end

number_of_attendees.times do 
    Attendee.create(
        name: Faker::Name.unique.name,
        age: (13..79).to_a.sample,
        email: Faker::Internet.email
    )
end

number_of_venues.times do 
    Venue.create(
        name: Faker::Artist.name,
        address: Faker::Address.street_address,
        #capacity: (500..5000).to_a.sample
    )
end

number_of_concerts.times do
    #venue_unique_id = (1..number_of_venues).to_a.sample
    #number_of_attendances = (200..venue_unique_id.capacity).to_a.sample
    Concert.create(
        show_date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
        artist_id: (1..number_of_artists).to_a.sample,
        #venue_id: venue_unique_id,
        venue_id: (1..number_of_venues).to_a.sample,
        # attendance: (500..5000).to_a.sample
        #fix attendance, right now it is possible to have higher attendance than capacity
    )
end

number_of_attendees_concerts.times do
    AttendeeConcert.create(
        attendee_id: (1..2000).to_a.sample,
        concert_id: (1..60).to_a.sample
    )
end

puts <<-OUTPUT
------------------------
DATA SUCCESSFULLY SEEDED
------------------------
#{Artist.all.count} artists created
#{Attendee.all.count} attendees created
#{Venue.all.count} venues created
#{Concert.all.count} concerts created
#{AttendeeConcert.all.count} Attendees_Concerts created
OUTPUT

#
#how many attendance (table) ids belong to a specfic Concert id
