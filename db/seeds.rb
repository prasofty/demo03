# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user = User.new(email: 'admin@admin.com', password: '123456', password_confirmation: '123456')
user.save!
puts "#### -- #{user.id}"
AdminUser.create(user_id: user.id)
employee = Employee.new(user_id: user.id, first_name: 'Admin', last_name: 'User')
employee.save(validate: false)
