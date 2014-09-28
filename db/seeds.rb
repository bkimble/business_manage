# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
manager1 = User.create(name: "billy", phone: "504-450-3281", email: "basslines@gmail.com", is_manager: true)
sub1 = User.create(name: "sub1", phone: "504-443-3231", email: "sub1@gmail.com", manager: manager1)
sub2 = User.create(name: "sub2", phone: "504-413-32431", email: "sub2@gmail.com", manager: manager1)
manager2 = User.create(name: "bad manager", phone: "504-111-2222", email: "bad@manager.com", is_manager: true)
sub2 = User.create(name: "sub3", phone: "121-443-3231", email: "sub3@gmail.com", manager: manager2)
sub3 = User.create(name: "sub4", phone: "311-413-32431", email: "sub4@gmail.com", manager: manager2)
