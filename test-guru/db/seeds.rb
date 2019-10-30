# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  categories = Category.create([
                                {title: 'Ruby'},
                                {title: 'HTML'},
                                {title: 'JS'},
                                {title: 'CSS'}])

  tests = Test.create([{ title: 'Ruby', level: 0, category_id: 1 },
                      { title: 'Ruby on Rails', level: 1, category_id: 1 },
                      { title: 'HTML', level: 0, category_id: 2 },
                      { title: 'HTML 5', level: 1, category_id: 2 },
                      { title: 'JS', level: 0, category_id: 3 },
                      { title: 'CSS', level: 0, category_id: 4 }])

  questions = Question.create([{ text: 'Класс это...', answer: 'Объект'},
                             { text: 'Объект это...', answer: 'Класс'}])

  answers = Answer.create([{ correct: false, question_id: 1},
                           { correct: false, question_id: 2}])

  users = User.create([{ name: 'Beginer'}])
