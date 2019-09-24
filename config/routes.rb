Rails.application.routes.draw do


  root to: 'pages#main'

  get 'app' => 'pages#app'

  get 'newsletter/buy' => 'users#new_buy'
  get 'newsletter/test' => 'users#new_test'
  post 'users/create' => 'users#create'
end
