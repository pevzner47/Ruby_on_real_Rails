class Test < ApplicationRecord
  class << self
    def all_tests_in_category(category_name)
      pp Test.where('title: ?', category_name).order('title DESC')
    end
  end
end
