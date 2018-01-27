Rails.application.routes.draw do
  resources :lots do 
  	resources :rates
  end
  resources :my_lots
  resources :finish_lots
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  root 'lots#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

end
