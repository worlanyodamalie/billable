# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
UserLevel.delete_all
admin_level = UserLevel.create!(level: 'Administrator', is_admin: true)
UserLevel.create!(level: 'Standard User', is_admin: false)
User.delete_all
User.create!(username:'admin', name:'Admin', email:'ich@neurotroph.de', password:'admin', password_confirmation:'admin', user_level: admin_level)