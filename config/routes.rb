Rails.application.routes.draw do
  # Это правило говорит: если пользователь заходит по адресу /, направь его в
  # контроллер users, действие index. Грубо говоря, на главной странице у нас
  # список юзеров.
  root to: 'users#index'

  # Эти две строчки добавляют ресурсы для пользователей и вопросов. Ресурс — это
  # набор путей для управления соответствующей моделью. Посмотрите, что напишет
  # команда
  resources :users, except: [:destroy]
  resource :session, only: [:destroy, :create, :new]
  resources :questions, except: [:index, :new, :show]
end
