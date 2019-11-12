class TestsController < ApplicationController

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
    redirect_to root_path
  end

  def new

  end

  
end
