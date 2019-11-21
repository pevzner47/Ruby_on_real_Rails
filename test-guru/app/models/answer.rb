class Answer < ApplicationRecord
  belongs_to :question

  scope :right_ones, -> { where(correct: true) }

  validate :validate_answers_number, on: :create
  validates :body, presence: true

  private

  def validate_answers_number
    errors.add(:question) if question.answers.count >= 4
  end
end
