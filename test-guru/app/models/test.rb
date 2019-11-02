class Test < ApplicationRecord
  has_many :users_tests
  has_many :users, through: :users_tests
  belongs_to :category

  class << self
    def all_tests_in_category(category_name)
      Test.joins("INNER JOIN categories ON categories.id = tests.category_id").order('title DESC').where(categories: { name: category_name}).pluck(:title)
    end
  end
end
