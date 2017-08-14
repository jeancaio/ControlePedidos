Rails.application.routes.draw do
  root 'home#index'

  devise_for :usuarios
    
end
