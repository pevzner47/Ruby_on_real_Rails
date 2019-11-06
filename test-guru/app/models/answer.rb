class Answer < ApplicationRecord
  belongs_to :question

  scope :right_ones, -> { where(correct: true) }

  validate :validate_answers_number, on: :create

  #private

  def validate_answers_number
    errors.add(:question) if self.question.answers.count < 0 || self.question.answers.count >= 4
  end
end
