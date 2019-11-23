class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_save :before_create_set_next_question#, on: :create

  # Первое задание ТЗ выполнено неправильно
  # Сейчас тест начинается со второго вопроса
  # Логично предположить что колбэк вызывается два раза
  # хочу чтобы вызвался только в create но опция on: :create не работает на всем кроме before_validation



  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def completed?
    current_question.nil?
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answer_count = correct_answer.count

    correct_answer_count == answer_ids.count && (correct_answer_count == correct_answer.where(id: answer_ids).count)
  end

  def before_create_set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', self.current_question.id).first
  end

  def correct_answer
    self.current_question.answers.right_ones
  end

  def current_question_persisted?
    self.current_question.present?
  end
end
