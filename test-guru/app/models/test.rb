class Test < ApplicationRecord
  has_many :users_tests
  has_many :users, through: :users_tests
  belongs_to :category

  class << self
    def all_tests_in_category(category_name)
      Test.joins("INNER JOIN categories ON categories.id = tests.category_id AND categories.name = '#{category_name}'", ).order('title DESC').select(:title) #здесь почему то не получилось через '?'
    end
  end
end
