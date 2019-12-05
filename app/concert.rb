class Concert < ActiveRecord::Base
    has_many :attendees, through: :attendee_concerts
    belongs_to :artist
    belongs_to :venue
end