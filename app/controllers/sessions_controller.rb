class SessionsController < ApplicationController
  def new; end

  def create
    user = User.authenticate(params[:email], params[:password])

    if user.present?
      session[:user_id] = user.id
      redirect_to root_path, notice: t('controllers.sessions.created')
    else
      flash.now.alert = t('controllers.sessions.failed')
      render :new
    end
  end

  def destroy
    # Затираем в сесси значение ключа :user_id
    session[:user_id] = nil

    # Редиректим пользователя на главную с сообщением
    redirect_to root_path, notice: t('controllers.sessions.destroyed')
  end
end
