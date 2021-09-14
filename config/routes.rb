Rails.application.routes.draw do
  devise_for :users
  root to: 'events#index'

  get 'admin', to: 'events#admin', as: 'admin'
  resources :events do
    resources :attendants, only: %i[new create]
    resources :declarations, only: %i[show new create]
  end

  resources :attendants, only: :destroy

  get 'success', to: 'success#index'
  get 'full', to: 'success#full', as: 'full'
  get 'ready/:id', to: 'declarations#ready'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
