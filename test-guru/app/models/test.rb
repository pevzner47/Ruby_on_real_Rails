class Test < ApplicationRecord
  has_many :users_tests
  has_many :users, through: :users_tests

  class << self
    def all_tests_in_category(category_name)
      #category_id = Category.where(title: category_name).first.id
      categories = Category.find_by(title: category_name)
      return puts 'categoty not found' if categories.nil?
      category_id = categories.id
      tests = Test.order('title DESC').where(category_id: category_id)
      names_array = []
      tests.each {|test| names_array << test.title}
      names_array
    end
  end
end
