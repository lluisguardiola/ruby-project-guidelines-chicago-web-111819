class AttendeeConcert < ActiveRecord::Base
    belongs_to :attendee
    belongs_to :concert
end