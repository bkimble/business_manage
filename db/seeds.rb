# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
manager = User.create(name: "billy", phone: "504-450-3281", email: "basslines@gmail.com")
sub1 = User.create(name: "sub1", phone: "504-443-3231", email: "sub1@gmail.com", manager: manager)
sub2 = User.create(name: "sub2", phone: "504-413-32431", email: "sub2@gmail.com", manager: manager)
