class CreateConcerts < ActiveRecord::Migration[4.2]
    def change
        create_table :concerts do |t|
            t.date :show_date
            t.integer :artist_id
            t.integer :venue_id
            t.integer :attendance
            t.timestamps
        end
    end
end