class Rating < ActiveRecord::Base
	attr_accessible :resumeid, :userid, :rating_score, :rate_time
	
	belongs_to :resume
	belongs_to :user, :class_name => 'User', :foreign_key => 'userid'
	
	validates :resumeid, :presence => true
	validates :userid, :presence => true
	validates :rating_score, :presence => true
	validates_inclusion_of :rating_score, :in => [1,2,3,4,5] 
	#validates :rate_time, :presence => true
end

# == Schema Information
#
# Table name: ratings
#
#  id           :integer         not null, primary key
#  resumeid     :integer
#  userid       :integer
#  rating_score :integer
#  rate_time    :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

