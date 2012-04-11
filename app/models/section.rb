class Section < ActiveRecord::Base
	attr_accessible :typesection, :content, :userid
	
	belongs_to :user
	
	validates :typesection, :presence => true
	validates :content, :presence => true
	validates :userid, :presence => true
end

# == Schema Information
#
# Table name: sections
#
#  id          :integer         not null, primary key
#  typesection :string(255)
#  content     :string(255)
#  userid      :integer
#  created_at  :datetime
#  updated_at  :datetime
#

