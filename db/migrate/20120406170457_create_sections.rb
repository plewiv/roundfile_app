class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.string :typesection
      t.string :content
      t.integer :userid

      t.timestamps
    end
  end

  def self.down
    drop_table :sections
  end
end
