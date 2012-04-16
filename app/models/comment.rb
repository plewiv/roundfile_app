class Comment < ActiveRecord::Base	
	attr_accessible :resumeid, :userid, :comment, :comment_time
	
	belongs_to :resume
	belongs_to :user, :class_name => 'User', :foreign_key => 'userid'
	
	validates :resumeid, :presence => true
	validates :userid, :presence => true
	validates :comment, :presence => true
	#validates :comment_time, :presence => true
end

# == Schema Information
#
# Table name: comments
#
#  id           :integer         not null, primary key
#  resumeid     :integer
#  userid       :integer
#  comment      :string(255)
#  comment_time :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

