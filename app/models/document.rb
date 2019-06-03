class Document < ApplicationRecord
  belongs_to :document_category
  belongs_to :document_state
  belongs_to :employee
  has_attached_file :file
  do_not_validate_attachment_file_type :file

  validates :document_date, :deadline_date, :employee_id, presence: true

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
