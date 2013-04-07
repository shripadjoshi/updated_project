# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'CREATING ROLES'
Role.create!([
  { name: 'admin' },
  { name: 'chemist' },
  { name: 'editor' }
], without_protection: true)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! name: 'Shripad', email: 'shripad.joshi.s@gmail.com', password:  '123123', password_confirmation: '123123'
puts 'New user created: ' << user.name
user2 = User.create! name: 'Glen', email: 'glen.noronha@gmail.com', password: '123123', password_confirmation: '123123'
puts 'New user created: ' << user2.name
user3 = User.create! name: 'Rahul', email: 'rahul.patil@gmail.com', password: '123123', password_confirmation: '123123'
puts 'New user created: ' << user3.name
user.add_role :admin
user2.add_role :chemist
user3.add_role :editor
