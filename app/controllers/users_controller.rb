class UsersController < ApplicationController
  before_action :load_user, except: [:index, :create, :new, :destroy]
  before_action :authorize_user, except: [:index, :new, :create, :show, :destroy]

  def create
    # Если пользователь уже авторизован, ему не нужна новая учетная запись, отправляем его на главную с сообщением.
    redirect_to root_url, alert: 'Вы уже авторизованы' if current_user.present?

    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: 'Регистрация успешна!'
    else
      # Если не удалось по какой-то причине сохранить пользователя, то рисуем
      # (обратите внимание, это не редирект), страницу new с формой
      # пользователя, который у нас лежит в переменной @user. В этом объекте
      # содержатся ошибки валидации, которые выведет шаблон формы.
      render 'new'
    end
  end

  def destroy
    current_user.destroy
    session.destroy
    redirect_to root_url, alert: 'Пользователь удален!'
  end

  def edit
  end

  def index
    @users = User.all
  end

  def new
    # Если пользователь уже авторизован, ему не нужна новая учетная запись,
    # отправляем его на главную с сообщением.
    redirect_to root_url, alert: 'Вы уже авторизованы' if current_user.present?

    @user = User.new
  end

  def show
    @questions = @user.questions.order(created_at: :desc)
    @new_question = @user.questions.build

    @questions_count = @questions.count
    @unanswered_count = @questions.unanswered.count
    @answered_count = @questions.answered.count
  end

  def update
    if @user.update(user_params)
      # Если удалось, отправляем пользователя на страницу профиля с сообщение, что данные профиля обновлены.
      redirect_to user_path(@user), notice: 'Данные профиля обновлены!'
    else
      # Если не получилось, как и в create рисуем страницу редактирования
      # пользователя, на которой нам будет доступен объект @user, содержащий
      # информацию об ошибках валидации, которые отобразит форма.
      render 'edit'
    end
  end
end

private

def authorize_user
  reject_user unless @user == current_user
end

def load_user
  @user = User.find(params[:id])
end

def user_params
  params.require(:user).permit(:email, :password, :password_confirmation, :name, :username, :avatar_url, :background,)
end
