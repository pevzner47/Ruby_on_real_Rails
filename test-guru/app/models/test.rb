class Test < ApplicationRecord
  belongs_to :category, optional: true #при удалении категрии связь с ней не проверяется
  belongs_to :author, class_name: "User", optional: true #при удалении автора связь с ним не проверяется
  has_many :questions, dependent: :nullify # при удалении теста вопрос остается а информация о тесте в вопросе обнуляется
  has_many :users_tests, dependent: :destroy # при удалении теста соединительная таблица удаляется
  has_many :users, through: :users_tests

  MIN_LEVEL_VALUE = 0
  private_constant :MIN_LEVEL_VALUE

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: MIN_LEVEL_VALUE}
  validate :validate_unique_test

  def self.all_tests_in_category(category_name)
    joins(:category).order('title DESC').where(categories: { name: category_name}).pluck(:title)
  end
  #этот метод нельзя будет соеденить с другими scope методами потому что по ТЗ он возвращает массив

  def self.difficulty(diff)
    case diff
    when "easy"
      level_value = 0..1
    when "medium"
      level_value = 2..4
    when "hard"
      level_value = 5..Float::INFINITY
    else return nil
    end
    where(level: level_value)
  end

  private

  def validate_unique_test
    errors.add(:title, :level) if Test.find_by(title: self.title ,level: self.level)
  end
end
