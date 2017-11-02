Rails.application.routes.draw do
  resources :lots
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  root 'lots#index'

end
