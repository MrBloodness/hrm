class Employee < ApplicationRecord

  has_many :work_logs
  validates :first_name, :last_name, :email, presence: true

  def to_s
  	"#{first_name} #{last_name}"
  end

end

# == Schema Information
#
# Table name: employees
#
#  actual_address          :text
#  available               :boolean          default(TRUE)
#  bank_account            :string
#  bank_name               :string
#  created_at              :datetime         not null
#  email                   :string
#  employed_since          :date
#  external_phone          :string
#  first_name              :string
#  id                      :integer          not null, primary key
#  internal_phone          :string
#  last_name               :string
#  legal_address           :text
#  mobile_phone            :string
#  nonstandart_worktime    :string
#  private_phone           :string
#  remaining_vacation_days :integer
#  salary                  :decimal(6, 2)
#  state_id                :integer
#  unused_vacation_days    :integer
#  updated_at              :datetime         not null
#  vacation_start_date     :date
#  worktime                :integer
#
