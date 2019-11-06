class User < ApplicationRecord
  has_many :users_tests, dependent: :destroy
  has_many :tests, through: :users_tests
  has_many :created_tests, class_name: "Test", foreign_key: "author_id", dependent: :nullify #при удалении пользователя тест, который создал пользователь, остается а информация об авторе обнуляется

  validates :name, presence: true
  def passes_tests(level)
    tests.with_difficulty_level(level)
  end
  #в документации написано, что scope методы из user можно вызывать либо на классе User либо на связи состоящей из объектов user
end
