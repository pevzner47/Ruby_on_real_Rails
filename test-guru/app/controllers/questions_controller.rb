class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found


  def index
    questions = @test.questions.pluck(:text)
    render plain: questions.join("\n")
  end

  def show
    question = Question.find(params[:id])
    render plain: question.text
  end

  def create
    question = Question.create(question_params)
    question.save
    render plain: question.inspect
  end

  def new

  end

  def destroy
    question = Question.find(params[:id])
    question.delete
    render html: "question with id = #{question.id} deleted".html_safe
  end

  private

  def question_params
    params.require(:question).permit(:text, :answer, :test_id)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end
