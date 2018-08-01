Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :path => '', 
              :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
              :controllers => {:registrations => 'registrations',
              :confirmations=>'confirmations',
              :omniauth_callbacks=>'omniauth_callbacks'
            }
              
  resources :users, only: [:show]
  resources :adventures do
    resources :reservations, only: [:create]
    resources :reviews, only: [:create, :destroy]
  end
  resources :photos
  
  resources :conversations, only: [:index, :create] do
      resources :messages, only: [:index, :create]
  end
  
  get '/search' => 'pages#search'
  get '/newsletter' => 'pages#newsletter'
  get '/contact' => 'pages#contact'
  get '/terms' => 'pages#terms'
  get '/privatepolicy' => 'pages#policy'
  
  root 'pages#home'
end
