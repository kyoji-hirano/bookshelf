# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ActiveRecord::Base.connection.tables.each do |table|
#   next if table == 'schema_migrations'
#   # MySQL and PostgreSQL
#   ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
# end

#ユーザー
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             user_code: "admin")

20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               user_code: "u#{n+1}")
end

my_account = User.create!(name:  "Hirano",
                          email: "gg.11sstar@gmail.com",
                          password:              "passpass",
                          password_confirmation: "passpass",
                          admin: true,
                          user_code: "me")

#グループ1
first_group = Group.create!(name: "SAMPLE GROUP", code: "g01")

5.times do |n|
  Book.create!(name: "sample_book_#{n+1}",
               description: "sample",
               group_id: first_group.id,
              )
end

ReviewComment.create!(content: "良かった",
                      user_id: 1,
                      book_id: 1,
                      date: Time.current,
                      grade: 1,
                      reply_to: nil)

ReviewComment.create!(content: "分かりやすい",
                      user_id: 2,
                      book_id: 1,
                      date: Time.current,
                      grade: 1,
                      reply_to: nil)

ReviewComment.create!(content: "初心者向け",
                      user_id: 2,
                      book_id: 3,
                      date: Time.current,
                      grade: 1,
                      reply_to: nil)

#グループ2
public_group = Group.create!(name: "PUBLIC GROUP", code: "g02")

15.times do |n|
Book.create!(name: "sample_book_#{n+6}",
             description: "sample",
             group_id: public_group.id)
end

#グループ3
private_group = Group.create!(name: "Hirano's BOOKS", code: "g03")

5.times do |n|
  Book.create!(name: "sample_book_#{n+21}",
               description: "sample",
               group_id: private_group.id)
end