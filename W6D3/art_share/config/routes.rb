Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users, only:[ :create, :index, :show, :update, :destroy]
  resources :artworks, only:[ :create, :index, :show, :update, :destroy]

end
