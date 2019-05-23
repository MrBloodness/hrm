class UserClassifier < ApplicationRecord
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
