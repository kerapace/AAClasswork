Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :session, only: [:new, :create, :destroy]
  resources :users
  resources :subs do
    resources :posts, only: [:show, :new, :create]
  end
  resources :posts, only: [:edit, :update, :destroy]

end
