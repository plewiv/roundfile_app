class Resumesection < ActiveRecord::Base

	attr_accessible :resumeid, :sectionid, :order
	
	belongs_to :resume
	belongs_to :section
	has_one :section, :class_name => "Section", :conditions => {:primary => true}
	
	validates :resumeid, :presence => true
	validates :sectionid, :presence => true
	validates :order, :presence => true
	
end
