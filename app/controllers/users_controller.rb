class UsersController < ApplicationController
  # Это действие отзывается, когда пользователь заходит по адресу /users
  def index
    # Мы создаем массив из двух болванок пользователей. Для создания фейковой
    # модели мы просто вызываем метод User.new, который создает модель, не
    # записывая её в базу.
    @users = [
      User.new(
        id: 1,
        name: 'Max',
        username: 'Saimon',
        avatar_url: 'https://super-avatara.ru/images/trueimg/pictures/40/13D33D8F9B83-40.jpg'
      ),
      User.new(id: 2, name: 'Vika', username: 'Viki')
    ]
  end

  def new
  end

  def edit
  end

  def show
    # Болванка пользователя
    @user = User.new(
      name: 'Max',
      username: 'saimon',
      avatar_url: 'https://super-avatara.ru/images/trueimg/pictures/40/13D33D8F9B83-40.jpg'
    )

    # Болванка вопросов для пользователя
    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('07.04.2021')),
      Question.new(text: 'В чем смысл жизни?', created_at: Date.parse('08.04.2021'))
    ]

    # Болванка для нового вопроса
    @new_question = Question.new

    # Обратите внимание, пока ни одна из болванок не достается из базы
  end
end
