Rails.application.routes.draw do
  resources :produtos
  resources :clientes
  root 'home#index'

  devise_for :usuarios
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
