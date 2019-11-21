module QuestionsHelper
  MAX_NUMBER_OF_QUESTIONS = 10
  ACTION_HEADER = { false => "Create New", true => "Edit"}

  def can_add_question_to_this_test?(test)
    test.questions.count < MAX_NUMBER_OF_QUESTIONS
  end

  def question_header(question)
    "#{ACTION_HEADER[question.persisted?]} '#{question.test.title}' Question"
  end
end
