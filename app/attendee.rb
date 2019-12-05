class Attendee < ActiveRecord::Base
    has_many :concerts, through: :attendee_concerts
end