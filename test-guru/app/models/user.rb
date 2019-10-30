class User < ApplicationRecord
  def passes_tests(level)
    pp Test.where('level: ?', level)
  end
end
