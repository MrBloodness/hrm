class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :skip_password_validation  # virtual attribute to skip password validation while saving

  protected

  def password_required?
    return false if skip_password_validation
    super
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
