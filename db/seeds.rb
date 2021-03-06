# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

my_account = User.create!(name:  "Hirano",
                          email: "gg.11sstar@gmail.com",
                          password:              "passpass",
                          password_confirmation: "passpass",
                          admin: true)

first_group = Group.create!(name: "SAMPLE GROUP", user_ids: [1, 2, 3, 4, 5])

5.times do |n|
  Book.create!(name: "sample_book_#{n+1}",
               description: "sample",
               group_id: first_group.id)
end

public_group = Group.create!(name: "PUBLIC GROUP", user_ids: (1..21).to_a)

15.times do |n|
Book.create!(name: "sample_book_#{n+6}",
             description: "sample",
             group_id: public_group.id)
end

private_group = Group.create!(name: "Hirano's BOOKS", user_ids: [my_account.id])

5.times do |n|
  Book.create!(name: "sample_book_#{n+21}",
               description: "sample",
               group_id: private_group.id)
end