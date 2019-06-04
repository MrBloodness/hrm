# == Schema Information
#
# Table name: users
#
#  avatar_file_name       :string
#  created_at             :datetime         not null
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  department_id          :integer
#  email                  :string           default(""), not null
#  employed_since         :date
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  id                     :integer          not null, primary key
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  occupation_id          :integer
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  salary                 :decimal(6, 2)
#  sign_in_count          :integer          default(0), not null
#  state_id               :integer
#  updated_at             :datetime         not null
#

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_url
    assert_response :success
  end

end
