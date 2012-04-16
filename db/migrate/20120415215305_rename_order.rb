class RenameOrder < ActiveRecord::Migration
  	def self.up
    rename_column :resumesections, :order, :orderNum
  end

  def self.down

  end
end
