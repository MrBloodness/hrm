require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: documents
#
#  created_at           :datetime         not null
#  deadline_date        :date
#  description          :text(65535)
#  document_category_id :integer
#  document_date        :date
#  document_state_id    :integer
#  employee_id          :integer
#  file_content_type    :string(255)
#  file_file_name       :string(255)
#  file_file_size       :bigint
#  file_updated_at      :datetime
#  id                   :integer          not null, primary key
#  number               :string(255)
#  title                :string(255)
#  updated_at           :datetime         not null
#  user_id              :integer
#
