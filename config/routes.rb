Rails.application.routes.draw do
  # Эти две строчки добавляют ресурсы для пользователей и вопросов. Ресурс — это
  # набор путей для управления соответствующей моделью. Посмотрите, что напишет
  # команда
  resources :users
  resources :questions
  # Это правило говорит: если пользователь заходит по адресу /, направь его в
  # контроллер users, действие index. Грубо говоря, на главной странице у нас
  # список юзеров.
  root to: 'users#index'
  # get 'users/index'
  # get 'users/new'
  # get 'users/edit'
  # get 'users/show'
  # # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get 'show' => 'users#show'
end
