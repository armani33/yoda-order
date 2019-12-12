Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'pages#main'

  get 'rent-a-yoda' => 'pages#rent'
  get 'buy-a-yoda'  => 'pages#buy'
  get 'cart' => 'pages#cart'
  get 'warranty' => 'pages#warranty'
  get 'faq' => 'pages#faq'
  get 'delivery' => 'pages#delivery'
  get 'returns' => 'pages#returns'
  get 'privacy-policy' => 'pages#privacy_policy'
  get 'terms-of-use' => 'pages#terms_of_use'


  resources :contact, only: [:create]
  get 'contact' => 'contact#contact'


  get 'users/create' => 'users#create'
  post 'users/subscribe' => 'users#create_subscriber'
  post 'users/email-verification' => 'users#email_verification'
  get 'rent-a-yoda/refer-a-friend' => 'users#refer'
end
