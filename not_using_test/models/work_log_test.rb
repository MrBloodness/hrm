require 'test_helper'

class WorkLogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: work_logs
#
#  comment          :text(65535)
#  created_at       :datetime         not null
#  employee_id      :integer
#  id               :integer          not null, primary key
#  log_date         :date
#  spent_time       :decimal(10, 2)
#  updated_at       :datetime         not null
#  work_log_type_id :integer
#