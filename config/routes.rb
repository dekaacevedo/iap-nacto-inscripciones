Rails.application.routes.draw do
  devise_for :users
  root to: 'events#index'

  resources :events do
    resources :attendants, only: %i[new create]
  end

  get 'success', to: 'success#index'
  get 'full', to: 'success#full', as: 'full'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
