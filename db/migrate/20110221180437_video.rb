class Video < ActiveRecord::Migration
   def self.up
     create_table :videos do |t|
        t.string :token
	t.string :connected_to
	t.integer :active
     end
   end
   def self.down
     drop_table :videos
   end
end
