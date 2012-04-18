class Section < ActiveRecord::Base
	attr_accessible :typesection, :content, :userid, :title
	
	belongs_to :user, :class_name => 'User', :foreign_key => 'userid'
	has_many :resumesection, :class_name => 'Resumesection', :dependent => :destroy, :foreign_key => 'sectionid'
		#belongs_to :resumesection

	validates :typesection, :presence => true
	validates :content, :presence => true
	validates :userid, :presence => true
	validates :title, :presence => true
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
#  title       :string(255)
#

