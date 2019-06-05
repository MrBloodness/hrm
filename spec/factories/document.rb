FactoryGirl.define do
  factory :document do
    number = Faker::Number.decimal_part(3)
    title = Faker::DcComics.title
    description = Faker::Lorem.paragraph
    employee { create :employee }
    document_category { create :document_category }
    document_state { create :document_state }
    document_date { Date.today }
    deadline_date { Faker::Date.between(Date.tomorrow, 10.days.from_now) }
  end
end
