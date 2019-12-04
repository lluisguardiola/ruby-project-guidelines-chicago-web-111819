class CreateFanconcerts < ActiveRecord::Migration[4.2]
    def change
        create_table :fanconcerts do |t|
            t.integer :concert_id
            t.integer :fan_id
            t.timestamps
        end
    end
end