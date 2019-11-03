class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :users_tests, dependent: :destroy
  has_many :users, through: :users_tests, dependent: :destroy

  class << self
    def all_tests_in_category(category_name)
      Test.joins(:category).order('title DESC').where(categories: { name: category_name}).pluck(:title)
    end
  end
end
