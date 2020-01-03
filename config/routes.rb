Rails.application.routes.draw do
  get 'welcome/homepage'
  resources :trainers, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :bookings, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :user_sessions, only: [:new, :create]
  resources :trainer_sessions, only: [:new, :create]

  root 'welcome#homepage'

  delete '/user_sessions', to: 'user_sessions#destroy'
  delete '/trainer_sessions', to: 'trainer_sessions#destroy'

  


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
