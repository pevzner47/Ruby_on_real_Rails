class Test < ApplicationRecord
  belongs_to :category, optional: true #при удалении категрии связь с ней не проверяется
  belongs_to :user, optional: true #при удалении автора связь с ним не проверяется
  has_many :questions, dependent: :nullify # при удалении теста вопрос остается а информация о тесте в вопросе обнуляется
  has_many :users_tests, dependent: :destroy # при удалении теста соединительная таблица удаляется
  has_many :users, through: :users_tests

  class << self
    def all_tests_in_category(category_name)
      Test.joins(:category).order('title DESC').where(categories: { name: category_name}).pluck(:title)
    end
  end
end
