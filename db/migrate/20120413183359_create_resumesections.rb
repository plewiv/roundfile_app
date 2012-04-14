class CreateResumesections < ActiveRecord::Migration
  def self.up
    create_table :resumesections do |t|
      t.integer :resumeid
      t.integer :sectionid
      t.integer :order

      t.timestamps
    end
  end

  def self.down
    drop_table :resumesections
  end
end
