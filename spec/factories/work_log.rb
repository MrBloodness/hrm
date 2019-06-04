FactoryGirl.define do
  factory :work_log do
    employee { create :employee }
    work_log_type { create :work_log_type }
    spent_time { Faker::Number.between(1, 8) }
    comment { Faker::Lorem.sentence }
    log_date { Faker::Date.forward(5) }
  end
end
