class QuestionsController < ApplicationController
  before_action :log_check

  def index
    #@questions = Question.all
  end

  def index_col
    @questions = Question.all #where(user.type == 1-5)に書き換える
  end

  def index_hs
    @questions = Question.all #where(user.type == 0)に書き換える
  end

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
private
  def log_check
    if logged_in?
    else
      redirect_to login_path
    end
  end

end
