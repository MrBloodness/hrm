work_log_types = ['Working', 'On vacation', 'Sick', 'Absent']
employee_states = ['Active', 'Former', 'Potential']
document_categories = ['Agreement', 'Offer', 'Invoice']
document_states = ['Open', 'Closed']

unless User.exists?
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
end

unless EmployeeState.exists?
  employee_states.each do |esa|
    EmployeeState.create! do |es|
      es.value = esa
    end
  end
end

# 3.times do
#   EmployeeState.create! do |es|
#     es.value = employee_states.sample
#   end
# end

unless Employee.exists?
  4.times do
    Employee.create! do |e|
      e.first_name = Faker::Name.first_name
      e.last_name = Faker::Name.last_name
      e.employee_state = EmployeeState.all.sample
      e.employed_since = Faker::Date.between(Date.two_years_ago, Date.yesterday)
      email_name = "#{e.first_name}_#{e.last_name}".parameterize('_')
      email_host = ['inbox.lv', 'gmail.com'].sample
      e.email = "#{email_name}@#{email_host}"
    end
  end
end

unless DocumentCategory.exists?
  document_categories.each do |dca|
    DocumentCategory.create! do |dc|
      dc.value = dca
    end
  end
end

# 3.times do
#   DocumentCategory.create! do |dc|
#     dc.value = document_categories.sample
#   end
# end

unless DocumentState.exists?
  document_states.each do |dsa|
    DocumentState.create! do |ds|
      ds.value = dsa
    end
  end
end

# 2.times do
#   DocumentState.create! do |ds|
#     ds.value = document_states.sample
#   end
# end

unless Document.exists?
  4.times do
    Document.create! do |d|
      d.number = Faker::Number.decimal_part(3)
      d.title = Faker::DcComics.title
      d.description = Faker::Lorem.paragraph
      d.user_id = User.all.sample.id
      d.employee_id = Employee.all.sample.id
      d.document_category = DocumentCategory.all.sample
      d.document_state = DocumentState.all.sample
      d.document_date = Date.today
      d.deadline_date = Faker::Date.between(Date.tomorrow, 10.days.from_now)
    end
  end
end

unless WorkLogType.exists?
  work_log_types.each do |wlt|
    WorkLogType.create! do |wt|
      wt.value = wlt
    end
  end
end

# 4.times do
#   WorkLogType.create! do |wt|
#     wt.value = work_log_types.sample
#   end
# end

unless WorkLog.exists?
  2.times do
    WorkLog.create! do |w|
      w.employee_id = Employee.all.sample.id
      w.work_log_type = WorkLogType.all.sample
      w.spent_time = Faker::Number.between(1, 8)
      w.comment = Faker::Lorem.sentence
      w.log_date = Faker::Date.forward(5)
    end
  end
end
