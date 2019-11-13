class TestsController < ApplicationController

  before_action :find_test, only: %i[show]

  def index

    # render html: '<h1>All tests</h1>'.html_safe

    #render json: {tests: Test.all}

    #render inline: '<p>My favourite language is: <%= %[ybuR].reverse! =%></p>'

    #render file: 'public/about.html', layout: false

    # respond_to do |format|
    #   format.html { render plain: 'All tests'}
    #   format.json { render json: { tests: Test.all } }

    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]

    render plain: result.join("\n")

  end

  def show
    title = Test.first.title

    #render inline: '<%= title %>'
    render inline: '<%= @test.title %>'

    #redirect_to root_path
  end

  def new

  end

  def create

    test = Test.create(test_params)

    render plain: test.inspect

  end

  def search
    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]

    render plain: result.join("\n")
  end

  private

  def test_params
    params.require(:test).permit(:title, :level)
  end

  def find_test
    @test = Test.find(params[:id])
  end


end
