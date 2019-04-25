Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :artworks, only: [:update, :create, :destroy, :show]
  resources :artwork_shares, only: [:create, :destroy]

  resources :users, only: [:index, :update, :create, :destroy, :show] do
    resources :artworks, only: [:index]
  end
end
