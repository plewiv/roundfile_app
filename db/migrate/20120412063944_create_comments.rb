class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :resumeid
      t.integer :userid
      t.string :comment
      t.datetime :comment_time

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
