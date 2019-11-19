class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :create, :new]
  before_action :find_question, only: [:show, :destroy, :edit, :update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found


  def index
    @questions = @test.questions
  end

  def show
    @test = Test.find(@question.test_id)
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save then
      redirect_to @question
    else
      render :new
    end
  end

  def new
    @question = @test.questions.new
  end

  def destroy
    @question.destroy
    redirect_to tests_path
  end

  def edit; end

  def update
    if @question.update(question_params) then
      redirect_to @question
    else
      render :edit
    end
  end

  private

  def question_params
    params.require(:question).permit(:text, :test_id)
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
