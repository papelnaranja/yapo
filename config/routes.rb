Rails.application.routes.draw do
  # get 'sales/create'
  # get 'products/create'
  root to: "products#index"
  resources :products do
    resources :sales, only: [:create]
  end
  devise_for :users, controllers: {
      registrations: 'users/registrations'
  } 
  resources :sales, only: [:index]
  get 'users/:user_id', to: 'users#show', as: 'user'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end