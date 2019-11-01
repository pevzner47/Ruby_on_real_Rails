class User < ApplicationRecord
  has_many :users_tests
  has_many :tests, through: :users_tests

  def passes_tests(level)
    tests = Test.joins("JOIN users_tests ON users_tests.user_id = #{ self.id.to_s} AND users_tests.test_id = tests.id").where('tests.level = ?', level)
                                                                # ^  и здесь не смог через "?"
  end
end
