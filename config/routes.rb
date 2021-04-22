Rails.application.routes.draw do
  devise_for :users
  resources :messages do
    resources :comments, only: [ :new, :create ]
  end
  resources :comments, only: [ :destroy ]

  root 'messages#index'
end
