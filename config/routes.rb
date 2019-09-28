Rails.application.routes.draw do


  root to: 'pages#main'

  get 'app' => 'pages#app'
  get 'reviews' => 'pages#reviews'


  get 'newsletter/buy' => 'users#new_buy'
  get 'newsletter/test' => 'users#new_test'
  post 'users/create' => 'users#create'


  get 'reviews/manage/new' => 'reviews#new'
  post 'reviews/manage/create' => 'reviews#create'
  get 'reviews/manage' => 'reviews#manage'
  resources :reviews, only: [:edit, :update, :destroy]


end
