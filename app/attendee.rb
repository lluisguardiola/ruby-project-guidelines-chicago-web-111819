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
            self.profile_actions
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

    def self.profile_actions
        puts "Would you like to continue to Search, or Edit your profile? (S/e)"
        login_choice = gets.chomp
        
        if login_choice.downcase == "s"
            puts `clear`
            Concert.search_select
        elsif login_choice.downcase == "e"
            puts `clear`
            puts "Would you like to Update your profile information, or Delete your profile? (U/d)"
            profile_edit = gets.chomp

            if profile_edit.downcase == "u"
                puts `clear`
                self.edit_profile
            elsif profile_edit.downcase == "d"
                puts `clear`
                self.delete_profile
            else
                puts "Response not recognized."
                sleep(3)
                self.profile_actions
            end
        end
    end

    def self.edit_profile
        puts "Please select from the following fields to make a change: Name, Age, or Email"
        profile_update = gets.chomp

        if profile_update.downcase == "name"
            self.edit_name
        elsif profile_update.downcase == "age"
            self.edit_age
        elsif profile_update.downcase == "email"
            self.edit_email
        else
            puts "Please select a field to edit from the options: Name, Age, or Email"
            sleep (2)
            self.edit_profile
        end
    end
                
                    

    def self.edit_name
        puts "Please confirm your current email to make changes:"
        email_input = gets.chomp
        current_user = self.all.find_by email: email_input
        if current_user == nil
            puts "Unable to validate email. Please try again."
            sleep (3)
            puts `clear`
            self.edit_name
        end
        puts "\n"
        puts "Please enter your new Name:"
        new_name = gets.chomp
        puts "\n"
        puts "Your updated name will be '#{new_name}'. Is that correct? (y/n)"
        name_confirm = gets.chomp
        if name_confirm.downcase == "y"
            current_user.name = new_name
            puts "\n"
            puts "Your changes have been saved! Thanks, #{current_user.name}!"
            sleep(3)
            puts `clear`
            Concert.search_select
        elsif name_confirm.downcase == "n"
            self.edit_name
        else
            puts "Please enter (y/n)"
            sleep(2)
            puts `clear`
            self.edit_name
        end
    end

    def self.edit_age
        puts "Please confirm your current email to make changes:"
        email_input = gets.chomp
        current_user = self.all.find_by email: email_input
        if current_user == nil
            puts "Unable to validate email. Please try again."
            sleep (3)
            puts `clear`
            self.edit_age
        end
        puts "\n"
        puts "Please enter your new Age:"
        new_age = gets.chomp
        puts "\n"
        puts "Your updated age will be '#{new_age}'. Is that correct? (y/n)"
        age_confirm = gets.chomp
        if age_confirm.downcase == "y"
            current_user.age = new_age
            puts "\n"
            puts "Your changes have been saved! Thanks!"
            sleep(3)
            puts `clear`
            Concert.search_select
        elsif age_confirm.downcase == "n"
            self.edit_age
        else
            puts "Please enter (y/n)"
            sleep(2)
            puts `clear`
            self.edit_age
        end
    end

    def self.edit_email
        puts "Please confirm your current email to make changes:"
        email_input = gets.chomp
        current_user = self.all.find_by email: email_input
        if current_user == nil
            puts "Unable to validate email. Please try again."
            sleep (3)
            puts `clear`
            self.edit_email
        end
        puts "\n"
        puts "Please enter your new Email:"
        new_email = gets.chomp
        puts "\n"
        puts "Your updated email will be '#{new_email}'. Is that correct? (y/n)"
        email_confirm = gets.chomp
        if email_confirm.downcase == "y"
            current_user.email = new_email
            puts "\n"
            puts "Your changes have been saved! Thanks!"
            sleep(3)
            puts `clear`
            Concert.search_select
        elsif email_confirm.downcase == "n"
            self.edit_email
        else
            puts "Please enter (y/n)"
            sleep(2)
            puts `clear`
            self.edit_email
        end
    end

    def self.delete_profile
        puts "Please confirm your current email to make changes:"
        email_input = gets.chomp
        current_user = self.all.find_by email: email_input
        puts "\n"
        puts "We're sorry to see you go! Are you sure you want to delete your profile, #{current_user.name}? (y/N)"
        delete_choice = gets.chomp
        if delete_choice.downcase == "n"
            puts "\n"
            puts "Whew! That was a close one! Thanks for sticking around!"
            sleep(3)
            puts `clear`
            self.profile_actions
        elsif delete_choice.downcase == "y"
            puts "\n"
            puts "Your profile will be deleted. Please come back any time!"
            sleep(3)
            current_user.delete
            puts `clear`
            self.new_or_existing
        else
            puts `clear`
            self.delete_profile
        end
    end



    #method rsvp to concert
    #user can select search result and add their name to RSVP list for the concert
    #would need a way to select specific concert from list of results
    #possibly enter artist name from list to add RSVP to concert
    #confirmation for RSVPing to concert
    #would need a way for a user to manage current RSVPs

end
