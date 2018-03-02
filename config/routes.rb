Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :games do
    resources :bookings, except: [:index, :show, :destroy]
    resources :reviews , only: [:create, :new]
  end
  resources :reviews , only: [:destroy]
  resources :users, only: [:show, :edit, :update]
  resources :bookings, only: [:index, :show, :destroy]
  root to: 'pages#home'
  get 'bookings/:id/accept' => 'bookings#status_accept', as: 'accept'
  get 'bookings/:id/decline' => 'bookings#status_decline', as: 'decline'
  resources :users, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
