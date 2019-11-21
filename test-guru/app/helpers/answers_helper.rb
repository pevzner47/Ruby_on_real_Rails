module AnswersHelper
  MAX_NUMBER_OF_ANSWERS = 4

  def can_add_answer_to_this_question?(question)
    question.answers.count < MAX_NUMBER_OF_ANSWERS
  end
end
