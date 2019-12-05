class CreateAttendees < ActiveRecord::Migration[4.2]
    def change
        create_table :attendees do |t|
            t.string :name
            t.integer :age
            t.string :email
            t.timestamps
        end
    end
end