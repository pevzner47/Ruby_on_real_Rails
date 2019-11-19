module QuestionsHelper
  MAX_NUMBER_OF_QUESTIONS = 4
  ACTION_HEADER = { "new" => "Create New", "edit" => "Edit"}

  def can_add_question_to_this_test?(test)
    test.questions.count < MAX_NUMBER_OF_QUESTIONS
  end

  def question_header(action, test_id)
    "<h1> #{ACTION_HEADER[action]} '#{Test.find(test_id).title}' Question </h1>".html_safe
  end

  def current_year
    Date.today.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end
end
