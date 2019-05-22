namespace :db do
  task fake: :environment do
    load Rails.root.join('db/fake.rb')
  end
end
