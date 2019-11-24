module TestPassagesHelper
  def passage_status
    "#{@test_passage.current_question_nubmer} question out of #{@test_passage.test.questions.count}"
  end

  def succes_rate_style
    @test_passage.test_passed_seccessfully? ? 'test_passed' : 'test_failed'
  end

  def result_message
    @test_passage.test_passed_seccessfully? ? 'You have successfully passed the test' : 'Test failed'
  end
end
