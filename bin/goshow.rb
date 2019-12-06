#!/usr/bin/env ruby

require_relative '../config/environment'

puts `clear`
puts "Welcome to GoShow!"
puts "\n"
#assuming every user is a new user, send them directly to profile creation

Attendee.new_or_existing


puts `clear`

Concert.search_select

# binding.pry

# puts "finished"
# search_category = gets.chomp