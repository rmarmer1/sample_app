# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: 'Tama Tee', email: 'tama@cats.com', password: 'mistert', password_confirmation: 'mistert')

User.create(name: 'Kitty Katz ', email: 'kittyk@cats.com', password: 'misskatz', password_confirmation: 'misskatz')

User.create(name: 'Calico Kitty', email: 'calicok@cats.com', password: 'misterc', password_confirmation: 'misterc')