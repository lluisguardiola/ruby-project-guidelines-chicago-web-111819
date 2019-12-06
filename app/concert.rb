class Concert < ActiveRecord::Base
    has_many :attendees, through: :attendee_concerts
    belongs_to :artist
    belongs_to :venue

        def self.search_select
        puts "Please enter a search category to find events: artist, venue, or date."
        search_category = gets.chomp
        puts "\n"
        if search_category.downcase == "artist"
            puts "Please enter an artist name:"
            search_artist = gets.chomp
            self.artist_search(search_artist)
        elsif search_category.downcase == "venue"
            puts "Please enter a venue name:"
            search_venue = gets.chomp
            self.venue_search(search_venue)
        elsif search_category.downcase == "date"
            puts "Please enter a date using format 'YYYY-MM-DD'"
            search_date = gets.chomp
            self.date_search(search_date)
        else
            puts "Please enter a valid search category to find shows"
            puts "\n"
            sleep(3,)
            puts `clear`
            self.search_select
        end
    end

    #implemented fix for no results
    def self.artist_search(search_artist)
        found_artist = Artist.all.find_by name: search_artist
        if found_artist == nil
            puts "Sorry, we couldn't find any upcoming shows for that artist!"
            sleep(3)
            puts `clear`
            self.search_select
        else
            found_concerts = self.all.select {|o| o.artist_id == found_artist.id}
            puts "\n"
            puts "Here are all the upcoming shows for #{found_artist.name}"
            puts "\n"
            found_concerts.each do |concert|
                puts "#{concert.show_date}, at #{concert.venue.name}"
            end
            puts "\n"
            puts "Return to main search?"
            search_or_exit = gets.chomp
            if search_or_exit
                puts `clear`
                self.search_select
            end
        end
    end

    #Implemented fix to venue search if no venue is found by producing error if found_venue == nil, else printing dates and artists
    def self.venue_search(search_venue)
        found_venue = Venue.all.find_by name: search_venue
        if found_venue == nil
            puts "Sorry, we couldn't find any upcoming shows at that venue!"
            sleep(3)
            puts `clear`
            self.search_select
        else
            found_concerts = self.all.select {|o| o.venue_id == found_venue.id}
            puts "\n"
            puts "Here are all the upcoming shows at #{found_venue.name}"
            puts "\n"
            # binding.pry
            found_concerts.each do |concert|
                puts "#{concert.show_date} - #{concert.artist.name}"
            end
            puts "\n"
            puts "Return to main search?"
            search_or_exit = gets.chomp
            if search_or_exit
                puts `clear`
                self.search_select
            end
        end
    end

    def self.date_search(search_date)
        search_date = Date.parse(search_date)
        if self.all.find_by show_date: search_date
            found_concerts = self.all.select {|o| o.show_date == search_date}
            puts "\n"
            puts "The following shows are scheduled for #{search_date}:"
            puts "\n"
            # binding.pry
            found_concerts.each do |concert|
                puts "#{concert.artist.name} playing at #{concert.venue.name}"
            end
            puts "\n"
            puts "Return to main search?"
            search_or_exit = gets.chomp
            if search_or_exit
                puts `clear`
                self.search_select
            end
        else
            puts "Sorry, we couldn't find any shows on that date!"
            sleep(3)
            puts `clear`
            self.search_select
        end
    end

end