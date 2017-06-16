# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(firstName: 'Anatoly', lastName: 'Halfin', email: 'anatoly_halfin@outlook.com', password: 'password', password_confirmation: 'password', countryCode: '+380', phoneNumber: '11111111', tier_level: 1, verified: 1, activated: true, activated_at: Time.zone.now)
User.create(firstName: 'Mihsha', lastName: 'Voronin', email: 'mihsha1001@outlook.com', password: 'password', password_confirmation: 'password', countryCode: '+380', phoneNumber: '11111111', tier_level: 1, verified: 1, activated: true, activated_at: Time.zone.now)
