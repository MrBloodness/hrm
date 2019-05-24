# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create! do |u|
  u.first_name = 'Admin'
  u.last_name = 'Example'
  u.email = 'admin@example.com'
  u.password = 'password'
  u.password_confirmation = 'password'
end
