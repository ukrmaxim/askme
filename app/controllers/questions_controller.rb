class QuestionsController < ApplicationController
  before_action :load_question, only: %i[destroy edit update]
  before_action :authorize_user, except: [:create]

  def create
    @question = Question.new(question_params)
    @question.author = current_user

    unless verify_recaptcha?(params[:recaptcha_token], 'question')
      return redirect_to user_path(@question.user), notice: t('recaptcha.errors.verification_failed')
    end

    if @question.save
      redirect_to user_path(@question.user), notice: t('controllers.questions.created')
    else
      render :edit
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to user_path(@question.user), notice: t('controllers.questions.updated')
    else
      render :edit
    end
  end

  def destroy
    user = @question.user
    @question.destroy
    redirect_to user_path(user), notice: t('controllers.questions.destroyed')
  end

  private

  def authorize_user
    reject_user unless @question.user == current_user
  end

  def load_question
    @question = Question.find(params[:id])
  end

  def question_params
    if current_user.present? && params[:question][:user_id].to_i == current_user.id
      params.require(:question).permit(:user_id, :text, :answer)
    else
      params.require(:question).permit(:user_id, :text)
    end
  end
end
