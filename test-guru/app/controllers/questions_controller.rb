class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :create]
  before_action :find_question, only: [:show, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found


  def index
    questions = @test.questions.pluck(:text)
    render plain: questions.join("\n")
  end

  def show
    render plain: @question.text
  end

  def create
    question = @test.questions.create(question_params)
    render plain: question.inspect
  end

  def new; end

  def destroy
    @question.destroy
    render html: "question with id = #{@question.id} deleted".html_safe
  end

  private

  def question_params
    params.require(:question).permit(:text)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end
