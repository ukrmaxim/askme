class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new; end

  def edit
  end

  def show
    @user = User.find(params[:id])

    @questions = @user.questions

    # Болванка для нового вопроса
    @new_question = Question.new

    @questions_count = @questions.count
    @unanswered_count = @questions.unanswered.count
    @answered_count = @questions.answered.count
  end
end
