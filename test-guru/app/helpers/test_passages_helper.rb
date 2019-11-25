module TestPassagesHelper
  def passage_status
    "#{@test_passage.current_question_nubmer} question out of #{@test_passage.test.questions.count}"
  end

  def succes_rate_style
    @test_passage.passed? ? 'test_passed' : 'test_failed'
  end

  def result_message
    @test_passage.passed? ? 'You have successfully passed the test' : 'Test failed'
  end
end
