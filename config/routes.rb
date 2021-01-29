Rails.application.routes.draw do
  devise_for :pros, path: 'pro'
  devise_for :users, path: 'free'
  get 'hello_world', to: 'hello_world#index'
  root 'codes#index'
  get 'home/index'
  resources :codes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
