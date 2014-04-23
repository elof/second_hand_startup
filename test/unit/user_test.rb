# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  username            :string(255)
#  email               :string(255)
#  password_digest     :string(255)
#  image_url           :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  provider            :string(255)
#  uid                 :string(255)
#  remember_token      :string(255)
#  image_url_file_name :string(255)
#  image_content_type  :string(255)
#  image_file_size     :integer
#  image_updated_at    :datetime
#  image_file_name     :string(255)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
