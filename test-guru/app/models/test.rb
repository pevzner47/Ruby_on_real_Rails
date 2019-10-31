class Test < ApplicationRecord
  has_many :users_tests
  has_many :users, through: :users_tests
  belongs_to :category

  class << self
    def all_tests_in_category(category_name)
      # categories = Category.find_by(title: category_name)
      # return puts 'categoty not found' if categories.nil?
      # category_id = categories.id
      # tests = Test.order('title DESC').where(category_id: category_id)
      # names_array = []
      # tests.each {|test| names_array << test.title}
      # names_array
      a = Test.joins("INNER JOIN categories ON categories.id = tests.category_id AND categories.title = '#{category_name}'") #здесь почему то не получилось через '?'
      a#Попробовать изменить переменную title на name
    end
  end
end
