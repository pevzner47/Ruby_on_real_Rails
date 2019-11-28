require "digest/sha1"

class User < ApplicationRecord

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: "author_id", dependent: :nullify

  validates :name, presence: true
  validates :email, presence: true,  uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  # validates :email,
  # validates :email,

  has_secure_password

  def passes_tests(level)
    tests.with_difficulty_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

end
