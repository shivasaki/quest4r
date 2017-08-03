class QuestionController < ApplicationController
  def index
    #@questions = Question.all
  end

  def index_col
    @questions = Question.where(user.type == 1-5)
  def show
  end

  def new
    #question = Question.new
  end

  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: '質問を作成しました' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

end
