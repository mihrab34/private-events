Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :sessions, only: %i[new create destroy]
  resources :events do
    member do
      post 'attend', to: 'invitations#create'
      delete 'unattend', to: 'invitations#destroy'
    end
  end

  root 'events#index'

  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
end
