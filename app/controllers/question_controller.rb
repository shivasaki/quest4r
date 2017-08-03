class QuestionController < ApplicationController
  def index
    #@questions = Question.all
  end

  def show
  end

  def new
    #@text = Text.new
  end

  def create
    @text = Question.new(text_params)

    respond_to do |format|
      if @text.save
        format.html { redirect_to @text, notice: 'Text was successfully created.' }
        format.json { render :show, status: :created, location: @text }
      else
        format.html { render :new }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

end
