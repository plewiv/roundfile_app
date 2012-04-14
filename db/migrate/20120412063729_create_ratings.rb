class CreateRatings < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|
      t.integer :resumeid
      t.integer :userid
      t.integer :rating_score
      t.datetime :rate_time

      t.timestamps
    end
  end

  def self.down
    drop_table :ratings
  end
end
