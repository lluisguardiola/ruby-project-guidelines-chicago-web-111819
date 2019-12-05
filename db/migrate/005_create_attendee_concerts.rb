class CreateAttendeeConcerts < ActiveRecord::Migration[4.2]
    def change
        create_table :attendee_concerts do |t|
            t.integer :concert_id
            t.integer :attendee_id
            t.timestamps
        end
    end
end