class TestsController < ApplicationController
  before_action :find_test, only: [:show, :edit, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index

    # render html: '<h1>All tests</h1>'.html_safe

    #render json: {tests: Test.all}

    #render inline: '<p>My favourite language is: <%= %[ybuR].reverse! =%></p>'

    #render file: 'public/about.html', layout: false

    # respond_to do |format|
    #   format.html { render plain: 'All tests'}
    #   format.json { render json: { tests: Test.all } }

    # result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    #
    # render plain: result.join("\n")
    @tests = Test.all

  end

  def show
    #render inline: '<%= title %>'
    #render inline: '<%= @test.title %>'

    #redirect_to root_path
  end

  def new
    @test = Test.new
  end

  def edit; end

  def create
    @test = Test.new(test_params)
    if @test.save then
      redirect_to @test
    else
      render :new
    end
  end

  def update
    if @test.update(test_params) then
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def search
    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    render plain: result.join("\n")
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: 'Test not found'
  end

end
