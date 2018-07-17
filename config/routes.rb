Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :path => '', 
              :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
              :controllers => {:registrations => 'registrations' }
              
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
  
  root 'pages#home'
end
