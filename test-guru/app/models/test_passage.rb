class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_find_current_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def succes_rate
    (self.correct_questions.to_f / self.test.questions.count.to_f * 100).round
  end

  def test_passed_seccessfully?
    succes_rate >= 85
  end

  def current_question_nubmer
    self.test.questions.order(:id).where('id <= ?', self.current_question.id).count
  end

  private

  def before_validation_find_current_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answer_count = correct_answer.count

    correct_answer_count == answer_ids.count && (correct_answer_count == correct_answer.where(id: answer_ids).count)
  end

  def next_question
    current_question ? test.questions.order(:id).where('id > ?', self.current_question.id).first : test.questions.first
  end

  def correct_answer
    self.current_question.answers.right_ones
  end

  def current_question_persisted?
    self.current_question.present?
  end
end
