class User < ApplicationRecord
  has_many :users_tests
  has_many :tests, through: :users_tests

  def passes_tests(level)
    connections = UsersTest.where(user_id: self.id)
    return puts 'this user has not started any tests yet' if connections.nil?
    tests_id = []
    connections.each {|connection| tests_id << connection.test_id}
    tests = Test.where(level: level, id: tests_id)
    tests
  end
end
