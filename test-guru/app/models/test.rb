class Test < ApplicationRecord
  class << self
    def all_tests_in_category(category_name)
      #category_id = Category.where(title: category_name).first.id
      category_id = Category.find_by(title: category_name)
      return 'Категрии с таким именем не найдено' if category_id.nil?
      category_id = category_id.id
      tests = Test.order('title DESC').where(category_id: category_id)
      names_array = []
      tests.each {|test| names_array << test.title}
      names_array
    end
  end
end
