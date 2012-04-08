# == Schema Information
#
# Table name: sections
#
#  id         :integer         not null, primary key
#  type       :string(255)
#  content    :string(255)
#  userid     :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
