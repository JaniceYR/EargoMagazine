# == Schema Information
#
# Table name: wikis
#
#  id         :integer          not null, primary key
#  name       :string
#  logo_url   :string
#  site_type  :string
#  editor     :string
#  owner      :string
#  url        :string
#  founded    :integer
#  created    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class WikiTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
