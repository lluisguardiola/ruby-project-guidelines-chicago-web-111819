class Attendee < ActiveRecord::Base
    has_many :concerts, through: :attendee_concerts

    def self.new_or_existing
        puts "Are you a new user or returning user? (n/r)"
        user_status = gets.chomp

        if user_status.downcase == "n" || user_status.downcase == "new"
            puts "\n"
            puts "Thank you for using GoShow!"
            puts "Follow these steps to create your profile..."
            sleep(3)
            self.create_attendee_profile
        elsif user_status.downcase == "r" || user_status.downcase == "returning" 
            puts `clear`
            puts "Thank you for using GoShow! Please verify the email on your profile:"
            validate_email = gets.chomp
            self.validate_attendee(validate_email)
            puts `clear`
            # sleep(3)
            #REDIRECT USER TO A METHOD
            #SAID METHOD IS NOT WRITTEN YET
        else
            puts "Please enter (n/r)"
            sleep(3)
            self.new_or_existing
        end
    end

    def self.validate_attendee(email_input)
        if self.all.find_by email: email_input
            current_user = self.all.find_by email: email_input
            puts "User found. Welcome back, #{current_user.name.split[0]}!"
            sleep(3)
            puts `clear`
        else
            puts "Email not found"
            sleep(3)
            puts `clear`
            self.new_or_existing
        end
    end

    def self.create_attendee_profile
        puts `clear`
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
            puts "Please enter your correct information."
            sleep(3)
            self.create_attendee_profile
        else
            puts "Please enter (y/n)"
            sleep(3)
            self.verify_attendee_info
        end
    end
end
