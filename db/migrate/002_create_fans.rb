class CreateFans < ActiveRecord::Migration[4.2]
    def change
        create_table :fans do |t|
            t.string :name
            t.integer :age
            t.string :email
            t.timestamps
        end
    end
end