class Answer < ApplicationRecord
  belongs_to :question

  scope :right_ones, -> { where(correct: true) }

  validate :validate_answers_number

  private

  def validate_answers_number
    errors.add(:question) if !(1..4).include?(self.question.answers.count) #errors.add(:question) if
  end
end
