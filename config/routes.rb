Rails.application.routes.draw do
  devise_for :users
  get 'hello_world', to: 'hello_world#index'
  # root 'home#home'
  root to: "pages#index"
  get 'home/index'
  resources :codes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
