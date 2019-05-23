class DocumentState < UserClassifier
  has_many :document

  def to_s
    "#{value}"
  end

end

# == Schema Information
#
# Table name: user_classifiers
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  is_active  :boolean          default(TRUE)
#  type       :string(255)
#  updated_at :datetime         not null
#  value      :string(255)
#
