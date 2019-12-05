#!/usr/bin/env ruby

require_relative '../config/environment'

puts "Welcome to GoShow!"
#assuming every user is a new user, send them directly to profile creation

Attendee.create_attendee_profile


puts `clear`
puts "finished"
# search_category = gets.chomp