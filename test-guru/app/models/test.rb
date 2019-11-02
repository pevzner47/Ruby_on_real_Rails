class Test < ApplicationRecord
  has_many :questions
  has_many :users_tests #оставил с прошлого задания
  has_many :users, through: :users_tests #оставил с прошлого задания
  belongs_to :category #оставил с прошлого задания

  class << self
    def all_tests_in_category(category_name)
      Test.joins("INNER JOIN categories ON categories.id = tests.category_id").order('title DESC').where(categories: { name: category_name}).pluck(:title)
    end
  end
end
