class Resume < ActiveRecord::Base

attr_accessible :name, :userid
	
	belongs_to :user
	has_many :section
	has_many :resumesection
	
	
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

