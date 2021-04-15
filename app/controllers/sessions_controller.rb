class SessionsController < ApplicationController
  def create
    user = User.authenticate(params[:email], params[:password])

    if user.present?
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Вы успешно авторизовались'
    else
      flash.now.alert = 'Неправильный email или пароль'
      render :new
    end
  end

  def destroy
    # Затираем в сесси значение ключа :user_id
    session[:user_id] = nil

    # Редиректим пользователя на главную с сообщением
    redirect_to root_url, notice: 'Возвращайтесь скорее!'
  end

  def new
  end
end
