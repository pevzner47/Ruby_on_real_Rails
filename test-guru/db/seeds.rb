# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  categories = Category.create!([
                                {name: 'Ruby'},
                                {name: 'HTML'},
                                {name: 'JS'},
                                {name: 'CSS'}])

users = User.create!([{ name: 'john@example.com'},
                      { name: 'bob@example.com'},
                      { name: 'jane@example.com'}])

  tests = Test.create!([{ title: 'Ruby', level: 0, author_id: users[1].id, category_id: categories[0].id },
                      { title: 'Ruby on Rails', level: 1, author_id: users[2].id, category_id: categories[0].id },
                      { title: 'HTML', level: 0, author_id: users[1].id, category_id: categories[1].id },
                      { title: 'HTML 5', level: 1, author_id: users[2].id, category_id: categories[1].id },
                      { title: 'JS', level: 0, author_id: users[1].id, category_id: categories[2].id },
                      { title: 'CSS', level: 0, author_id: users[1].id, category_id: categories[3].id }])

  questions = Question.create!([{ text: 'Класс это...', answer: 'Объект'},
                             { text: 'Объект это...', answer: 'Класс'}])

  answers = Answer.create!([{ correct: false, question_id: questions[0].id},
                           { correct: false, question_id: questions[1].id}])

  users_tests = UsersTest.create!([{ user_id: users[0].id, test_id: tests[0].id},
                                   { user_id: users[0].id, test_id: tests[1].id},
                                   { user_id: users[0].id, test_id: tests[2].id},
                                   { user_id: users[0].id, test_id: tests[3].id}])
