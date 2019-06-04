FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end

# == Schema Information
#
# Table name: users
#
#  avatar_file_name       :string(255)
#  created_at             :datetime         not null
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string(255)
#  department_id          :integer
#  email                  :string(255)      default(""), not null
#  employed_since         :date
#  encrypted_password     :string(255)      default(""), not null
#  first_name             :string(255)
#  id                     :integer          not null, primary key
#  last_name              :string(255)
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string(255)
#  occupation_id          :integer
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  salary                 :decimal(6, 2)
#  sign_in_count          :integer          default(0), not null
#  state_id               :integer
#  updated_at             :datetime         not null
#
