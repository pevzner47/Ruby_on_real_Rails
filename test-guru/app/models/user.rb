class User < ApplicationRecord
  has_many :users_tests
  has_many :tests, through: :users_tests

  def passes_tests(level)
    Test.joins("JOIN users_tests ON users_tests.test_id = tests.id").where(tests: { level: level}, users_tests: { user_id: self.id})
  end
end
