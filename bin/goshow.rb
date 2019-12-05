#!/usr/bin/env ruby

require_relative '../config/environment'

puts "\n"
puts "Welcome to GoShow! To begin, please enter your full name:"
puts "\n"
name = gets.chomp
puts "\n"
puts "Thank you #{name.split[0]}! Next, please enter your age:"
puts "\n"
age = gets.chomp
puts "\n"
puts "Great! Now, please enter your email address:"
puts "\n"
email = gets.chomp
user = Attendee.create(name: name, age: age, email: email)
puts "\n"
puts "Congratulations, #{name.split[0]}! Your profile is now complete!"
puts "\n"
puts user.name
puts user.age
puts user.email
puts "\n"

puts "Does everything look right? (y/n)"
profilestatus = gets.chomp

if profilestatus = "y" || "Y" || "yes" || "Yes"
    #continue
else
    #return to beginning of app
end

puts ~clear
puts "Welcome to GoShow, #{name.split[0]}! You can search for upcoming shows by entering: artist, date, or venue."
search_category = gets.chomp