Rails.application.routes.draw do


  devise_for :admins, :skip => [:registrations]

  root to: 'pages#main'

  get 'test-ride' => 'pages#test_ride'
  get 'cart' => 'pages#cart'
  get 'page/warranty' => 'pages#warranty'
  get 'page/faq' => 'pages#faq'
  get 'page/delivery' => 'pages#delivery'
  get 'page/returns' => 'pages#returns'
  get 'page/privacy-policy' => 'pages#privacy_policy'


  resources :contact, only: [:create]
  get 'page/contact' => 'contact#contact'

  post 'users/create' => 'users#create'


end
