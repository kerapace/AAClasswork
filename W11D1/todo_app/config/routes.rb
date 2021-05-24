Rails.application.routes.draw do
  namespace :api do
    resources :todos, only: [:index, :show, :create, :destroy, :update]
  end

  root to: 'static_pages#root'
end
