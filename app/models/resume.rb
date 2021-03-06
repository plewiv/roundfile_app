class Resume < ActiveRecord::Base

attr_accessible :name, :userid
	
	belongs_to :user, :class_name => 'User', :foreign_key => 'userid'
	has_many :section
	has_many :resumesection, :class_name => 'Resumesection',:dependent => :destroy, :foreign_key => 'resumeid'	
	
	validates :name, :presence => true
	validates :userid, :presence => true

end

# == Schema Information
#
# Table name: resumes
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  userid     :integer
#  created_at :datetime
#  updated_at :datetime
#

