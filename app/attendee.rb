class Attendee < ActiveRecord::Base
    has_many :concerts, through: :attendee_concerts

    def self.create_attendee_profile
        puts "\n"
        puts "Please enter your full name:"
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
        puts "Congratulations, #{name.split[0]}! Your profile is now saved!"
        puts "\n"
        puts user.name
        puts user.age
        puts user.email
        puts "\n"
        
        self.verify_attendee_info

        puts "Welcome to GoShow, #{name.split[0]}! You can search for upcoming shows by entering: artist, date, or venue."
    end

    def self.verify_attendee_info
        puts "Does everything look right? (y/n)"
        profilestatus = gets.chomp

        if profilestatus.downcase == "y" || profilestatus.downcase == "yes"
            puts "Great, your profile is complete!"
            sleep(3)
        elsif profilestatus.downcase == "n" || profilestatus.downcase == "no" 
            puts "PLEASE ENTER CORRECT VALUES."
            sleep(3)
            #here we would delete the user values
            #delete the attendee instance from db
            self.create_attendee_profile
        else
            puts "Please enter (y/n)"
            sleep(3)
            self.verify_attendee_info
        end
    end
end
