class Employee < ApplicationRecord
  has_many :work_logs
  has_many :documents
  belongs_to :employee_state
  
  validates :first_name, :last_name, :email, presence: true

  def to_s
    "#{first_name} #{last_name}"
  end

end

# == Schema Information
#
# Table name: employees
#
#  actual_address    :text(65535)
#  bank_account      :string(255)
#  bank_name         :string(255)
#  created_at        :datetime         not null
#  email             :string(255)
#  employed_since    :date
#  employee_state_id :integer
#  external_phone    :string(255)
#  first_name        :string(255)
#  id                :integer          not null, primary key
#  internal_phone    :string(255)
#  last_name         :string(255)
#  legal_address     :text(65535)
#  mobile_phone      :string(255)
#  private_phone     :string(255)
#  salary            :decimal(6, 2)
#  updated_at        :datetime         not null
#
