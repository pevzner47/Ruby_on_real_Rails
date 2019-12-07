class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: "author_id", dependent: :nullify

  validates :email, presence: true,  uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def passes_tests(level)
    tests.with_difficulty_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

end
