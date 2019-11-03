class User < ApplicationRecord
  has_many :users_tests, dependent: :destroy
  has_many :tests, through: :users_tests, dependent: :destroy
  has_many :tests

  def passes_tests(level)
    Test.joins(:users_tests).where(tests: { level: level}, users_tests: { user_id: self.id})
    #пытался сделать self.tests.where(tests: { level: level}) выдавало ошибку no such column: tests.user_id хотя в скринкасте был рассмотрен такой случай
  end
end
