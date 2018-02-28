Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :games do
    resources :bookings, except: [:index, :show, :destroy]
  end
  resources :users, only: [:show]
  resources :bookings, only: [:index, :show, :destroy]
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
