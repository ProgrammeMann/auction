Rails.application.routes.draw do
  resources :lots do 
  	resources :rates
  end
  resources :my_lots
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  root 'lots#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
