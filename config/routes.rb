Rails.application.routes.draw do
  # Это правило говорит: если пользователь заходит по адресу /, направь его в
  # контроллер users, действие index. Грубо говоря, на главной странице у нас
  # список юзеров.
  root to: 'users#index'

  # Эти две строчки добавляют ресурсы для пользователей и вопросов. Ресурс — это
  # набор путей для управления соответствующей моделью. Посмотрите, что напишет
  # команда
  resources :users
  resources :sessions, only: [:destroy, :create, :new]
  resources :questions, except: [:index, :new, :show]

  get 'sign_up' => 'users#new'
  get 'log_out' => 'sessions#destroy'
  get 'log_in' => 'sessions#new'
end
