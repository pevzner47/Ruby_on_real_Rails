class User < ApplicationRecord
  has_many :users_tests, dependent: :destroy
  has_many :tests, through: :users_tests
  has_many :created_tests, class_name: "Test", dependent: :nullify #при удалении пользователя тест, который создал пользователь, остается а информация об авторе обнуляется

  def passes_tests(level)
    self.tests.where(tests: { level: level})
  end
end
