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

  tests = Test.create!([{ title: 'Ruby', level: 0, author: users[1], category: categories[0] },
                        { title: 'Ruby on Rails', level: 1, author: users[2], category: categories[0] },
                        { title: 'HTML', level: 0, author: users[1], category: categories[1] },
                        { title: 'HTML 5', level: 1, author: users[2], category: categories[1] },
                        { title: 'JS', level: 0, author: users[1], category: categories[2] },
                        { title: 'CSS', level: 0, author: users[1], category: categories[3] }])
                        #author не модель

  questions = Question.create!([{ text: 'Класс это...', answer: 'Объект', test: tests[0]},
                                { text: 'Объект это...', answer: 'Класс', test: tests[0]}])

  answers = Answer.create!([{ correct: false, question: questions[0]},
                            { correct: false, question: questions[1]}])

  users_tests = UsersTest.create!([{ user: users[0], test: tests[0]},
                                   { user: users[0], test: tests[1]},
                                   { user: users[0], test: tests[2]},
                                   { user: users[0], test: tests[3]}])
