Rails.application.routes.draw do
  resources :users, only: [:show, :index, :new, :create]
  resource :session, only: [:new, :create, :destroy]
end
