# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do
  Ticket.create({title: Faker::Company.bs,
                  body: Faker::Lorem.paragraph,
            created_by: Faker::Internet.user_name,
      created_by_email: Faker::Internet.safe_email,
                status: 0
                   })
end
