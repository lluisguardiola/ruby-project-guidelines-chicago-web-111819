require 'faker'

number_of_artists = 30
number_of_concerts = 60
number_of_fans = 2000
number_of_venues = 10
number_of_fanconcerts = (500..5000).to_a.sample
#number_of_attendances = 0 #EDIT THIS LATER

number_of_artists.times do 
    Artist.create(
        name: Faker::Music.band,
        genre: Faker::Music.genre
    )
end

number_of_fans.times do 
    Fan.create(
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
        #attendance: number_of_attendances
        attendance: (500..5000).to_a.sample
        #fix attendance, right now it is possible to have higher attendance than capacity
    )
end

number_of_fanconcerts.times do
    Fanconcert.create(
        fan_id: (1..2000).to_a.sample,
        concert_id: (1..60).to_a.sample
    )
end

puts <<-OUTPUT
------------------------
DATA SUCCESSFULLY SEEDED
------------------------
#{Artist.all.count} artists created
#{Fan.all.count} fans created
#{Venue.all.count} venues created
#{Concert.all.count} concerts created
#{Fanconcert.all.count} FanConcerts created
OUTPUT

#
#how many attendance (table) ids belong to a specfic Concert id
