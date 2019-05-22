work_log_types = ['Working', 'On vacation', 'Sick', 'Absent']

2.times do
  User.create! do |u|
    u.first_name = Faker::Name.first_name
    u.last_name = Faker::Name.last_name
    email_name = "#{u.first_name}_#{u.last_name}".parameterize('_')
    email_host = ['inbox.lv', 'gmail.com'].sample
    u.email = "#{email_name}@#{email_host}"
    u.password = 'password'
    u.password_confirmation = 'password'
  end
end

4.times do
  Employee.create! do |e|
    e.first_name = Faker::Name.first_name
    e.last_name = Faker::Name.last_name
    email_name = "#{e.first_name}_#{e.last_name}".parameterize('_')
    email_host = ['inbox.lv', 'gmail.com'].sample
    e.email = "#{email_name}@#{email_host}"
  end
end

5.times do
  WorkLogType.create! do |wt|
    wt.value = work_log_types.sample
  end
end

2.times do
  WorkLog.create! do |w|
    w.employee_id = Employee.all.sample.id
    w.work_log_type = WorkLogType.all.sample
    w.spent_time = Faker::Number.between(1, 8)
    w.comment = Faker::Lorem.sentence
    w.log_date = Faker::Date.forward(5)
  end
end
