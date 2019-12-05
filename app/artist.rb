class Artist < ActiveRecord::Base
    has_many :attendees, through: :attendee_concerts
    has_many :concerts
    belongs_to :concert
end