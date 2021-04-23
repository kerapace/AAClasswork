Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

  resources :users, only: [ :create, :index, :show, :update, :destroy]
  resources :artworks, only: [ :create, :index, :show, :update, :destroy]
  resources :artwork_shares, only: :create
  get delete 'artwork_shares', to: 'artwork_shares#destroy'
  resources :users do
    resources :artworks, only: :index
  end

  resources :artworks do
    resources :comments, only: [:create, :destroy, :index]
  end
end
