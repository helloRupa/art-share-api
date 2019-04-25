Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :artwork_shares, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]

  resources :users, only: [:index, :update, :create, :destroy, :show] do
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
  end

  resources :artworks, only: [:update, :create, :destroy, :show] do
    resources :comments, only: [:index]
  end
end
