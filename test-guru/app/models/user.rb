class User < ApplicationRecord
  def passes_tests(level)
    Test.where('level: ?', level)
  end
end
