Rails.application.routes.draw do


  devise_for :admins, :skip => [:registrations]

  root to: 'pages#main'

  get 'bike' => 'pages#bike'
  get 'app' => 'pages#app'
  get 'reviews' => 'pages#reviews'
  get 'support' => 'pages#support'
  get 'test-ride' => 'pages#test_ride'
  get 'cart' => 'pages#cart'
  get 'page/warranty' => 'pages#warranty'
  get 'page/faq' => 'pages#faq'

  get 'newsletter/buy' => 'users#new_buy'
  get 'newsletter/test' => 'users#new_test'
  post 'users/create' => 'users#create'


  get 'reviews/manage/new' => 'reviews#new'
  post 'reviews/manage/create' => 'reviews#create'
  get 'reviews/manage' => 'reviews#manage'
  resources :reviews, only: [:show, :edit, :update, :destroy]


end
