module TestPassagesHelper
  def passage_status
    test = @test_passage.test
    current_number = test.questions.find_index(@test_passage.current_question) + 1
    "#{current_number} question out of #{test.questions.count}"
  end

  def succes_rate
    (@test_passage.correct_questions.to_f / @test_passage.test.questions.count.to_f * 100).round
  end

  def succes_rate_style
    test_passed_seccessfully? ? 'test_passed' : 'test_failed'
  end

  def result_message
    test_passed_seccessfully? ? 'You have successfully passed the test' : 'Test failed'
  end

  private

  def test_passed_seccessfully?
    succes_rate >= 85
  end
end
