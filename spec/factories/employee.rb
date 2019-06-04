FactoryGirl.define do
  factory :employee do
    sequence(:email) { |n| "employee#{n}@example.com" }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    employed_since { Faker::Date.between(2.years.ago, Date.yesterday) }
    employee_state { create :employee_state }
  end
end
