Rails.application.routes.draw do
  resources :skateboards
  devise_for :users
  root to: 'skateboards#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
