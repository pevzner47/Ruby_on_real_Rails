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

  users = User.create!([{ name: 'John', email: 'john@example.com'},
                        { name: 'Bob',  email: 'bob@example.com'},
                        { name: 'Jane', email: 'jane@example.com'}])

  tests = Test.create!([{ title: 'Ruby', level: 0,  author: users[1], category: categories[0] },
                        { title: 'Ruby on Rails', level: 4,  author: users[2], category: categories[0] },
                        { title: 'HTML', level: 0,  author: users[1], category: categories[1] },
                        { title: 'HTML 5', level: 10, author: users[2], category: categories[1] },
                        { title: 'JS', level: 5,  author: users[1], category: categories[2] },
                        { title: 'CSS', level: 0,  author: users[1], category: categories[3] }])

  questions = Question.create!([{ text: 'Класс это...',  test: tests[0]},
                                { text: 'Объект это...', test: tests[0]},
                                { text: 'JavaScript является подвидом Java?', test: tests[4]}])

  answers = Answer.create!([{ body: 'Хэш', correct: false, question: questions[0]},
                            { body: 'Класс', correct: false, question: questions[0]},
                            { body: 'Объект', correct: true,  question: questions[0]},
                            { body: 'Строка', correct: false, question: questions[1]},
                            { body: 'Все варианты неверны', correct: false, question: questions[1]},
                            { body: 'Класс', correct: true,  question: questions[1]},
                            { body: 'Да', correct: false, question: questions[2]},
                            { body: 'Нет', correct: true, question: questions[2]},
                            { body: 'Наоборот, Java - подвид JavaScript', correct: false,  question: questions[2]},])

  test_passages = TestPassage.create!([{ user: users[0], test: tests[0], current_question: questions[1], correct_questions: 1},
                                   { user: users[0], test: tests[4], current_question: questions[0], correct_questions: 0}])
